module Deco exposing (..)

import Data exposing (..)
import Json.Decode as D
import Json.Encode as E


repositoriesDecoder : D.Decoder (List Repository)
repositoriesDecoder =
    D.field "repositories" (D.list repositoryDecoder)


selectedReposDecoder : D.Decoder SelectedRepos
selectedReposDecoder =
    D.map2 SelectedRepos (D.field "anySelected" D.bool) (D.field "repos" (D.list repositoryDecoder))


selectedReposEncoder : SelectedRepos -> E.Value
selectedReposEncoder sel =
    E.object [ ( "anySelected", E.bool sel.anySelected ), ( "repos", E.list repositoryEncoder sel.repos ) ]


repositoryDecoder : D.Decoder Repository
repositoryDecoder =
    D.map3 Repository
        (D.field "name" D.string)
        (D.field "url" D.string)
        (D.field "trees" (D.list treeDecoder))


treeDecoder : D.Decoder Tree
treeDecoder =
    D.map2 Tree
        (D.field "name" D.string)
        (D.field "aspects" (D.list aspectInfoDecoder))


aspectInfoDecoder : D.Decoder AspectInfo
aspectInfoDecoder =
    D.map3 AspectInfo
        (D.field "aspect" D.string)
        (D.field "class" D.string)
        (D.field "files" (D.list D.string))


repositoryEncoder : Repository -> E.Value
repositoryEncoder repo =
    E.object
        [ ( "name", E.string repo.name )
        , ( "url", E.string repo.url )
        , ( "trees", E.list treeEncoder repo.trees )
        ]


treeEncoder : Tree -> E.Value
treeEncoder tree =
    E.object
        [ ( "name", E.string tree.name )
        , ( "aspects", E.list aspectInfoEncoder tree.aspects )
        ]


aspectInfoEncoder : AspectInfo -> E.Value
aspectInfoEncoder info =
    E.object
        [ ( "aspect", E.string info.aspect )
        , ( "class", E.string info.class )
        , ( "files", E.list E.string info.files )
        ]
