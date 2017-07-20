module AssetPath exposing (Asset(..), src, url)

{-| The core API of `AssetPath`: a union type and a function.

@docs Asset, url, src

-}

import Html
import Html.Attributes
import Native.AssetPath
import String


{-| Tag a path to a static asset as such.

Use `AssetUrl` to mark a fully qualified URL.
`url` will return the tagged value as-is.

-}
type Asset
    = AssetPath String
    | AssetUrl String


rootUrl : Maybe String
rootUrl =
    -- Note: does not end with a slash
    Native.AssetPath.rootUrl


{-| Try to get the full URL of an asset.

When supplied an `AssetUrl`, the tagged value is returned as-is.

When supplied an `AssetPath`, the tagged value is returned as-is
when no meta tag with the name `assets-root-url` is found.
In case such a meta tag is found, the return value is a concatenation
of the content attribute of the tag and the `AssetPath` value.

The meta tag needs to be present at the time Elm has been loaded.

-}
url : Asset -> String
url asset =
    case asset of
        AssetUrl url ->
            url

        AssetPath path ->
            toAbsoluteUrl path


{-| Makes an Html src attribute from an asset.
-}
src : Asset -> Html.Attribute msg
src asset =
    Html.Attributes.src <| url asset


toAbsoluteUrl : String -> String
toAbsoluteUrl assetPath =
    case rootUrl of
        Nothing ->
            assetPath

        Just host ->
            host ++ toAbsolutePath assetPath


toAbsolutePath : String -> String
toAbsolutePath s =
    if String.startsWith "/" s then
        s
    else
        "/" ++ s
