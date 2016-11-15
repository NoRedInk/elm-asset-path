module NoRootUrlTest exposing (..)

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
    describe "without assets-root-url"
        [ test "absolute path" <|
            \() ->
                Expect.equal (AssetPath.url <| Asset "/star.png") "/star.png"
        , test "relative path" <|
            \() ->
                Expect.equal (AssetPath.url <| Asset "star.png") "star.png"
        ]
