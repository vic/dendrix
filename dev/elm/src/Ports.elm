port module Ports exposing (..)

import Json.Decode as D
import Json.Encode as E


port cmdOut : E.Value -> Cmd msg


port cmdIn : (D.Value -> msg) -> Sub msg


cmdEncode : String -> E.Value -> E.Value
cmdEncode name val =
    E.object [ ( "name", E.string name ), ( "value", val ) ]


repoUpdate : String
repoUpdate =
    "REPO_UPDATE"


clearAll : String
clearAll =
    "CLEAR_ALL"


highlight : String
highlight =
    "HIGHLIGHT"


isCmd : String -> D.Value -> Bool
isCmd name json =
    D.decodeValue (D.field "name" D.string) json == Ok name


cmdVal : D.Decoder a -> D.Value -> Result D.Error a
cmdVal dec json =
    D.decodeValue (D.field "value" dec) json
