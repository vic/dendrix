module Results exposing (main)

import Browser
import Data
import Deco
import Dict exposing (Dict)
import Html exposing (Html, a, button, code, div, p, pre, text)
import Html.Attributes exposing (class, href, id)
import Html.Events exposing (onClick)
import Json.Decode as D
import Json.Encode as E
import List.Extra
import Ports
import Tuple


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    Data.SelectedRepos


init : () -> ( Model, Cmd Msg )
init () =
    ( { anySelected = False, repos = [] }, Cmd.none )


type Msg
    = UpdateResults Model
    | ClearFilters
    | Noop


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Noop ->
            ( model, Cmd.none )

        UpdateResults repos ->
            ( repos, sendHighlight )

        ClearFilters ->
            ( model, sendClearAll )


sendClearAll : Cmd Msg
sendClearAll =
    Ports.cmdOut (Ports.cmdEncode Ports.clearAll E.null)


sendHighlight : Cmd Msg
sendHighlight =
    Ports.cmdOut (Ports.cmdEncode Ports.highlight E.null)


view : Model -> Html Msg
view model =
    div []
        (if model.anySelected then
            viewSelectedRepos model

         else
            []
        )


viewSelectedRepos : Model -> List (Html Msg)
viewSelectedRepos model =
    let
        totalFiles =
            model.repos
                |> List.concatMap .trees
                |> List.concatMap .aspects
                |> List.concatMap .files
                |> List.length

        aspectClassMap =
            model.repos
                |> List.concatMap .trees
                |> List.concatMap .aspects
                |> List.map (\a -> ( a.aspect, a.class ))
                |> List.Extra.unique
                |> List.foldl
                    (\( aspect, class_ ) dict ->
                        Dict.update
                            aspect
                            (\maybeClasses ->
                                Just (class_ :: Maybe.withDefault [] maybeClasses)
                            )
                            dict
                    )
                    Dict.empty

        aspectCount =
            Dict.keys aspectClassMap |> List.length |> String.fromInt

        classesCount =
            Dict.values aspectClassMap |> List.concatMap identity |> List.Extra.unique |> List.length |> String.fromInt

        firstAspect =
            Dict.keys aspectClassMap |> List.head |> Maybe.withDefault "virtualisation"

        firstClass =
            Dict.get firstAspect aspectClassMap |> Maybe.andThen List.head |> Maybe.withDefault "nixos"
    in
    [ div [] [ button [ onClick ClearFilters ] [ text "Reset filters" ] ]
    , p []
        [ text (String.fromInt totalFiles ++ " nix files\n")
        , text ("contaning the following " ++ aspectCount ++ " aspects across " ++ classesCount ++ " configuration classes:\n")
        ]
    , p [] (viewAspectSummary aspectClassMap)
    , p []
        [ text "Add the following to your "
        , code [] [ text "flake.nix" ]
        , text " to include these configuration modules. See also: "
        , a [ href "Getting-Started.html" ] [ text "Usage for Dendrix Trees/Layers" ]
        ]
    , viewUsageCode model.repos
    , p []
        [ text "On a flake module of yours, extend any of these aspects with your custom configs, like:"
        , div []
            [ pre []
                [ code [ class "language-nix" ]
                    [ text ("""# modules/${aspect}.nix
{
  # eg flake.modules.""" ++ firstClass ++ "." ++ firstAspect ++ """ = { ... };
  flake.modules.${class}.${aspect} = { <your-configs> };
}
                    """)
                    ]
                ]
            ]
        ]
    ]


viewAspectSummary : Dict String (List String) -> List (Html msg)
viewAspectSummary aspectDict =
    aspectDict
        |> Dict.toList
        |> List.sortBy Tuple.first
        |> List.map
            (\( aspect, classes ) ->
                let
                    interspersed =
                        String.join "/" (List.sort classes)
                in
                div [] [ code [] [ text (aspect ++ ": " ++ interspersed) ] ]
            )


viewUsageCode : List Data.Repository -> Html msg
viewUsageCode repos =
    pre [ id "dendrix-usage" ]
        [ code [ class "language-nix" ]
            [ let
                trees =
                    List.concatMap (\repo -> List.map (\tree -> ( repo.name, tree.name )) repo.trees) repos

                repoImports =
                    List.map
                        (\( repoName, treeName ) ->
                            String.concat [ "    inputs.dendrix.", repoName, ".", treeName, "\n" ]
                        )
                        trees

                codes =
                    [ """# modules/dendrix-imports.nix -- on any module of yours.
{ inputs, ... }:
{
  imports = ["""
                    , "\n"
                    ]
                        ++ repoImports
                        ++ [ "  ];\n}", "\n" ]
              in
              text (String.concat codes)
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Ports.cmdIn
        (\cmd ->
            if Ports.isCmd Ports.repoUpdate cmd then
                toMsg <| Ports.cmdVal Deco.selectedReposDecoder cmd

            else
                Noop
        )


toMsg : Result D.Error Model -> Msg
toMsg result =
    case result of
        Ok repos ->
            UpdateResults repos

        Err _ ->
            UpdateResults { anySelected = False, repos = [] }
