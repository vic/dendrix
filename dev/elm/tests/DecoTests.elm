module DecoTests exposing (..)

import Data exposing (..)
import Deco
import Expect
import Json.Decode as D
import Test exposing (..)


exampleRepos : String
exampleRepos =
    """
{
  "repositories": [
    {
      "name": "vic-vix",
      "url": "http://example.org",
      "trees": [
         {
            "name": "default",
            "aspects": [
               { "aspect": "game", "class": "darwin", "files": ["file1", "file2"] },
               { "aspect": "game", "class": "nixos", "files": ["file3"] },
               { "aspect": "dev", "class": "nixos", "files": ["file3nixos"] },
               { "aspect": "dev", "class": "darwin", "files": ["file3darwin"] }
            ]
         }
      ]
    },
    {
        "name": "drupol-infra",
        "url": "http://example.org",
        "trees": [
            {
                "name": "default",
                "aspects": [
                    { "aspect": "dev", "class": "nixos", "files": ["a.nix"]},
                    { "aspect": "ai", "class": "nixos", "files": ["b.nix"]}
                ]
            }
        ]
    }
  ]
}
"""


suite : Test
suite =
    describe "Deco"
        [ describe "Repository"
            [ test "round-trips" <|
                \() ->
                    let
                        original : Result D.Error (List Repository)
                        original =
                            D.decodeString Deco.repositoriesDecoder exampleRepos

                        selected : Result D.Error SelectedRepos
                        selected =
                            Result.map (SelectedRepos False) original

                        encoded =
                            Result.map Deco.selectedReposEncoder selected

                        decoded =
                            Result.map (D.decodeValue Deco.selectedReposDecoder) encoded
                    in
                    Expect.equal (Ok (Ok { anySelected = False, repos = Result.withDefault [] original })) decoded
            ]
        ]
