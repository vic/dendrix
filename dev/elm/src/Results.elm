module Results exposing (main)

import Browser
import Data
import Deco
import Dict exposing (Dict)
import Html exposing (Html, button, code, div, h2, pre, text)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)
import Json.Decode as D
import Json.Encode as E
import List.Extra
import Ports
import Set
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
    in
    [ div [] [ button [ onClick ClearFilters ] [ text "Reset filters" ] ]
    , div []
        ([ text (String.fromInt totalFiles ++ " files\n")
         , text "contaning the following aspects:\n"
         ]
            ++ viewAspectSummary aspectClassMap
        )
    , viewUsage model.repos
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


viewUsage : List Data.Repository -> Html msg
viewUsage repos =
    pre [ id "dendrix-usage" ]
        [ code [ class "language-nix" ]
            [ let
                trees =
                    List.concatMap (\repo -> List.map (\tree -> ( repo.name, tree.name )) repo.trees) repos

                repoImports =
                    List.map
                        (\( repoName, treeName ) ->
                            String.concat [ "      inputs.dendrix.", repoName, ".", treeName, "\n" ]
                        )
                        trees

                codes =
                    [ """# Usage in your flake: 
{
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } 
    (inputs.import-tree [
      ./modules # your modules"""
                    , "\n"
                    ]
                        ++ repoImports
                        ++ [ "    ]);\n}", "\n" ]
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
