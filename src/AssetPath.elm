module AssetPath exposing (Asset(Asset), url)
{-|
Module for defining a typed asset path and obtaining its URL.

    import Html exposing (..)
    import Html.Attributes exposing (..)
    import AssetPath exposing(Asset(..))

    viewStar : Html msg
    viewStar =
        img [ src (AssetPath.url (Asset "/assets/star.png")) ]
            []

By default, the `src` of the image will be "/assets/star.png".

By including a meta tag with the name "assets-root-url" in your HTML,
you can control which host to direct requests for static assets:

    <meta name="assets-root-url" content="https://cdn.example.com/">
    ...
    <img src="https://cdn.example.com/assets/star.png"/>

@docs Asset, url
-}
import String
import Native.AssetPath


{-| Tag a path to a static asset as such.
-}
type Asset =
    Asset String


{- Note: does not end with a slash -}
rootUrl : Maybe String
rootUrl =
  Native.AssetPath.rootUrl


{-| Get the full URL of an asset.
-}
url : Asset -> String
url (Asset path) =
    case rootUrl of
        Nothing ->
            path

        Just host ->
            host ++ toAbsolutePath path


toAbsolutePath : String -> String
toAbsolutePath s =
    if String.startsWith "/" s then
        s
    else
        "/" ++ s
