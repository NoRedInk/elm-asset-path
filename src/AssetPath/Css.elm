module AssetPath.Css exposing (url)

{-|
Helper module for constructing commonly-used
asset reference functions in CSS properties.

@doc url
-}

import AssetPath exposing (Asset)


{-|
Given an `Asset`, wrap its URL in a call to `url()`.
-}
url : Asset -> String
url asset =
    "url(" ++ (AssetPath.url asset) ++ ")"
