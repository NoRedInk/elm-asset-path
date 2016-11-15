module WithRootUrlTest exposing (..)

import Test exposing (..)
import Test.Runner.Node exposing (run)
import Expect
import Json.Encode exposing (Value)
import Ports exposing (emit)
import AssetPath exposing (Asset(..))


main : Program Value
main =
    run emit all


all : Test
all =
    describe "url"
        [ test "absolute path" <|
            \() ->
                Expect.equal (AssetPath.url <| Asset "/star.png") "https://cdn.elm-lang.org/star.png"
        ,  test "relative path" <|
            \() ->
                Expect.equal (AssetPath.url <| Asset "star.png") "https://cdn.elm-lang.org/star.png"
        ]
