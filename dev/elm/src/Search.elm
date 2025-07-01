module Search exposing (main)

import Browser
import Data
import Deco
import Html exposing (Html, a, div, h4, input, label, small, span, text)
import Html.Attributes exposing (checked, disabled, href, style, type_)
import Html.Events exposing (onClick)
import Json.Decode as D
import List.Extra
import Ports


main : Program D.Value Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { repositories : List Data.Repository
    , allAspects : List String
    , allClasses : List String
    , selectedAspects : List String
    , selectedClasses : List String
    , selectedRepos : List String
    , selectedTrees : List ( String, String )
    , collapsedRepos : List String
    }


initialModel : List Data.Repository -> Model
initialModel repos =
    let
        allAspects =
            repos
                |> List.concatMap (.trees >> List.concatMap .aspects)
                |> List.map .aspect
                |> List.sort
                |> List.Extra.unique

        allClasses =
            repos
                |> List.concatMap (.trees >> List.concatMap .aspects)
                |> List.map .class
                |> List.sort
                |> List.Extra.unique
    in
    { repositories = repos
    , allAspects = allAspects
    , allClasses = allClasses
    , selectedAspects = []
    , selectedClasses = []
    , selectedRepos = []
    , selectedTrees = []
    , collapsedRepos = List.map .name repos
    }


init : D.Value -> ( Model, Cmd Msg )
init flags =
    let
        decodedRepos =
            D.decodeValue Deco.repositoriesDecoder flags
    in
    case decodedRepos of
        Ok repos ->
            ( initialModel repos, sendReposUpdate { anySelected = False, repos = [] } )

        Err _ ->
            ( initialModel [], Cmd.none )


sendReposUpdate : Data.SelectedRepos -> Cmd msg
sendReposUpdate repos =
    Ports.cmdOut <| Ports.cmdEncode Ports.repoUpdate (Deco.selectedReposEncoder repos)


type Msg
    = ToggleRepo String
    | ToggleAspect String
    | ToggleClass String
    | ToggleTree String String
    | ToggleCollapse String
    | Clear
    | Noop


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        toggle item list =
            if List.member item list then
                List.filter ((/=) item) list

            else
                item :: list

        newModel =
            case msg of
                Noop ->
                    model

                Clear ->
                    { model
                        | selectedRepos = []
                        , selectedAspects = []
                        , selectedClasses = []
                        , selectedTrees = []
                        , collapsedRepos = List.map .name model.repositories
                    }

                ToggleRepo repoName ->
                    { model | selectedRepos = toggle repoName model.selectedRepos }

                ToggleAspect aspectName ->
                    { model | selectedAspects = toggle aspectName model.selectedAspects }

                ToggleClass className ->
                    { model | selectedClasses = toggle className model.selectedClasses }

                ToggleTree repoName treeName ->
                    { model | selectedTrees = toggle ( repoName, treeName ) model.selectedTrees }

                ToggleCollapse repoName ->
                    { model | collapsedRepos = toggle repoName model.collapsedRepos }

        finalFilteredRepos =
            newModel.repositories
                |> filterByRepos newModel.selectedRepos
                |> filterByTrees newModel.selectedTrees
                |> filterByAspects newModel.selectedAspects
                |> filterByClasses newModel.selectedClasses

        selectedCount =
            List.length newModel.selectedRepos
                + List.length newModel.selectedClasses
                + List.length newModel.selectedAspects
                + List.length newModel.selectedTrees

        sel =
            Data.SelectedRepos (selectedCount > 0) finalFilteredRepos
    in
    ( newModel, sendReposUpdate sel )


view : Model -> Html Msg
view model =
    let
        reposFilteredForAvailability =
            model.repositories
                |> filterByAspects model.selectedAspects
                |> filterByClasses model.selectedClasses
                |> filterByTrees model.selectedTrees

        availableRepos =
            reposFilteredForAvailability
                |> List.map .name

        aspectsFilteredForAvailability =
            model.repositories
                |> filterByRepos model.selectedRepos
                |> filterByClasses model.selectedClasses
                |> filterByTrees model.selectedTrees

        availableAspects =
            aspectsFilteredForAvailability
                |> List.concatMap (.trees >> List.concatMap .aspects)
                |> List.map .aspect
                |> List.sort
                |> List.Extra.unique

        classesFilteredForAvailability =
            model.repositories
                |> filterByRepos model.selectedRepos
                |> filterByAspects model.selectedAspects
                |> filterByTrees model.selectedTrees

        availableClasses =
            classesFilteredForAvailability
                |> List.concatMap (.trees >> List.concatMap .aspects)
                |> List.map .class
                |> List.sort
                |> List.Extra.unique

        count list =
            list |> List.length |> String.fromInt
    in
    div []
        [ h4 [] [ text ("Dendritic Repositories (" ++ count availableRepos ++ ")") ]
        , viewRepoAndTreeCheckboxes model availableRepos
        , h4 [] [ text ("Nix Config Classes (" ++ count availableClasses ++ ")") ]
        , viewCheckboxList model.allClasses availableClasses model.selectedClasses ToggleClass
        , h4 [] [ text ("Dendritic Aspects (" ++ count availableAspects ++ ")") ]
        , viewCheckboxList model.allAspects availableAspects model.selectedAspects ToggleAspect
        ]


viewRepoAndTreeCheckboxes : Model -> List String -> Html Msg
viewRepoAndTreeCheckboxes model availableRepos =
    div []
        (List.map
            (\repo ->
                let
                    isRepoSelected =
                        List.member repo.name model.selectedRepos

                    isRepoAvailable =
                        List.member repo.name availableRepos

                    isRepoEnabled =
                        isRepoSelected || isRepoAvailable

                    availableTrees =
                        repo.trees
                            |> filterTreesByAspects model.selectedAspects
                            |> filterTreesByClasses model.selectedClasses

                    treeCount =
                        List.length availableTrees

                    isCollapsed =
                        List.member repo.name model.collapsedRepos

                    replaceArchivePath =
                        if String.contains "codeberg.org" repo.url then
                            String.replace "/archive/" "/src/commit/"

                        else
                            String.replace "/archive/" "/tree/"

                    repoHome =
                        repo.url
                            |> String.replace ".tar.gz" ""
                            |> replaceArchivePath
                in
                div [ style "margin-bottom" "1em" ]
                    [ div [ style "display" "flex", style "align-items" "center" ]
                        [ label
                            [ style "opacity"
                                (if isRepoEnabled then
                                    "1.0"

                                 else
                                    "0.5"
                                )
                            ]
                            [ input
                                [ type_ "checkbox"
                                , checked isRepoSelected
                                , onClick
                                    (if isRepoEnabled then
                                        ToggleRepo repo.name

                                     else
                                        Noop
                                    )
                                , disabled (not isRepoEnabled)
                                ]
                                []
                            , text repo.name
                            ]
                        , div [ style "cursor" "pointer", style "margin-left" "auto", style "display" "flex", style "align-items" "center" ]
                            [ small [ style "margin-right" "5px" ] [ a [ href repoHome ] [ text "(home)" ] ]
                            , span [ onClick (ToggleCollapse repo.name), style "display" "block ruby" ]
                                [ text
                                    (if isCollapsed then
                                        "►"

                                     else
                                        "▼"
                                    )
                                , small [] [ text ("(" ++ String.fromInt treeCount ++ " trees)") ]
                                ]
                            ]
                        ]
                    , if isCollapsed then
                        div [] []

                      else
                        div [ style "padding-left" "2em" ]
                            (List.map
                                (\tree ->
                                    let
                                        isTreeSelected =
                                            List.member ( repo.name, tree.name ) model.selectedTrees

                                        isTreeAvailable =
                                            List.member tree.name (List.map .name availableTrees)

                                        isTreeEnabled =
                                            isTreeSelected || isTreeAvailable

                                        files =
                                            tree.aspects |> List.concatMap (\a -> a.files)

                                        filesUrl =
                                            "https://github.com/vic/dendrix/blob/main/dev/community/discovered/" ++ repo.name ++ "/" ++ tree.name ++ ".json"
                                    in
                                    div [ style "margin-left" "auto", style "display" "flex" ]
                                        [ label
                                            [ style "opacity"
                                                (if isTreeEnabled then
                                                    "1.0"

                                                 else
                                                    "0.5"
                                                )
                                            ]
                                            [ input
                                                [ type_ "checkbox"
                                                , checked isTreeSelected
                                                , onClick
                                                    (if isTreeEnabled then
                                                        ToggleTree repo.name tree.name

                                                     else
                                                        Noop
                                                    )
                                                , disabled (not isTreeEnabled)
                                                ]
                                                []
                                            , text tree.name
                                            ]
                                        , div [ style "margin-left" "auto", style "display" "flex", style "align-items" "center" ]
                                            [ a [ href filesUrl ] [ text ((files |> List.length |> String.fromInt) ++ " files") ]
                                            ]
                                        ]
                                )
                                repo.trees
                            )
                    ]
            )
            model.repositories
        )


viewCheckboxList : List String -> List String -> List String -> (String -> Msg) -> Html Msg
viewCheckboxList allItems availableItems selectedItems msgConstructor =
    div []
        (List.map
            (\item ->
                let
                    isSelected =
                        List.member item selectedItems

                    isAvailable =
                        List.member item availableItems

                    isEnabled =
                        isSelected || isAvailable
                in
                div []
                    [ label
                        [ style "opacity"
                            (if isEnabled then
                                "1.0"

                             else
                                "0.5"
                            )
                        ]
                        [ input
                            [ type_ "checkbox"
                            , checked isSelected
                            , onClick
                                (if isEnabled then
                                    msgConstructor item

                                 else
                                    Noop
                                )
                            , disabled (not isEnabled)
                            ]
                            []
                        , text item
                        ]
                    ]
            )
            allItems
        )



-- FILTERING HELPERS


filterByTrees : List ( String, String ) -> List Data.Repository -> List Data.Repository
filterByTrees selectedTrees repos =
    if List.isEmpty selectedTrees then
        repos

    else
        repos
            |> List.map
                (\repo ->
                    let
                        relevantTrees =
                            selectedTrees
                                |> List.filter (\( r, _ ) -> r == repo.name)
                                |> List.map Tuple.second
                    in
                    if List.isEmpty relevantTrees then
                        { repo | trees = [] }

                    else
                        { repo
                            | trees =
                                repo.trees
                                    |> List.filter (\tree -> List.member tree.name relevantTrees)
                        }
                )
            |> List.filter (\repo -> not (List.isEmpty repo.trees))


filterByRepos : List String -> List Data.Repository -> List Data.Repository
filterByRepos selectedRepos repos =
    if List.isEmpty selectedRepos then
        repos

    else
        repos
            |> List.filter (\repo -> List.member repo.name selectedRepos)


filterByAspects : List String -> List Data.Repository -> List Data.Repository
filterByAspects selectedAspects repos =
    if List.isEmpty selectedAspects then
        repos

    else
        repos
            |> List.map (\repo -> { repo | trees = repo.trees |> filterTreesByAspects selectedAspects })
            |> List.filter (\repo -> not (List.isEmpty repo.trees))


filterTreesByAspects : List String -> List Data.Tree -> List Data.Tree
filterTreesByAspects selectedAspects trees =
    if List.isEmpty selectedAspects then
        trees

    else
        trees
            |> List.map
                (\tree ->
                    { tree | aspects = tree.aspects |> List.filter (\aspectInfo -> List.member aspectInfo.aspect selectedAspects) }
                )
            |> List.filter (\tree -> not (List.isEmpty tree.aspects))


filterByClasses : List String -> List Data.Repository -> List Data.Repository
filterByClasses selectedClasses repos =
    if List.isEmpty selectedClasses then
        repos

    else
        repos
            |> List.map (\repo -> { repo | trees = repo.trees |> filterTreesByClasses selectedClasses })
            |> List.filter (\repo -> not (List.isEmpty repo.trees))


filterTreesByClasses : List String -> List Data.Tree -> List Data.Tree
filterTreesByClasses selectedClasses trees =
    if List.isEmpty selectedClasses then
        trees

    else
        trees
            |> List.map
                (\tree ->
                    { tree | aspects = tree.aspects |> List.filter (\aspectInfo -> List.member aspectInfo.class selectedClasses) }
                )
            |> List.filter (\tree -> not (List.isEmpty tree.aspects))


subscriptions : Model -> Sub Msg
subscriptions _ =
    Ports.cmdIn
        (\cmd ->
            if Ports.isCmd Ports.clearAll cmd then
                Clear

            else
                Noop
        )
