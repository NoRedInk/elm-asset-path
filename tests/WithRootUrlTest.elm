module WithRootUrlTest exposing (..)

import Test exposing (..)
import Json.Encode exposing (Value)
import Expect
import AssetPath exposing (Asset(..))


all : Test
all =
    describe "all"
        [ test "absolute path" <|
            \() ->
                Expect.equal (AssetPath.url <| AssetPath "/star.png") "https://cdn.elm-lang.org/star.png"
        , test "relative path" <|
            \() ->
                Expect.equal (AssetPath.url <| AssetPath "star.png") "https://cdn.elm-lang.org/star.png"
        , test "url" <|
            \() ->
                Expect.equal (AssetPath.url <| AssetUrl "star.png") "star.png"
        ]
