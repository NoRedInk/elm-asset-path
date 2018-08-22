module Tests exposing (..)

import AssetPath
import AssetPath.Css
import Expect
import Fuzz
import Test exposing (..)


symmetry : Test
symmetry =
    fuzz Fuzz.string "Asset and url should be symmetrical" <|
        \string ->
            string
                |> AssetPath.Asset
                |> AssetPath.url
                |> Expect.equal string


cssUrl : Test
cssUrl =
    fuzz Fuzz.string "Css.url should wrap with a url() function" <|
        \string ->
            string
                |> AssetPath.Asset
                |> AssetPath.Css.url
                |> Expect.equal ("url(" ++ string ++ ")")
