module NoRootUrlTest exposing (..)

import Test exposing (..)
import Json.Encode exposing (Value)
import Expect
import AssetPath exposing (Asset(..))
import AssetPath.Css


all : Test
all =
    describe "without assets-root-url"
        [ describe "url"
            [ test "absolute path" <|
                \() ->
                    Expect.equal (AssetPath.url <| AssetPath "/star.png") "/star.png"
            , test "relative path" <|
                \() ->
                    Expect.equal (AssetPath.url <| AssetPath "star.png") "star.png"
            ]
        , describe "Css.url"
            [ test "absolute path" <|
                \() ->
                    Expect.equal (AssetPath.Css.url <| AssetPath "/star.png") "url(/star.png)"
            , test "relative path" <|
                \() ->
                    Expect.equal (AssetPath.Css.url <| AssetPath "star.png") "url(star.png)"
            ]
        ]
