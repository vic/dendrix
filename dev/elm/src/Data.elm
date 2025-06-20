module Data exposing (..)


type alias Repository =
    { name : String
    , url : String
    , trees : List Tree
    }


type alias SelectedRepos =
    { anySelected : Bool, repos : List Repository }


type alias Tree =
    { name : String
    , aspects : List AspectInfo
    }


type alias AspectInfo =
    { aspect : String
    , class : String
    , files : List String
    }
