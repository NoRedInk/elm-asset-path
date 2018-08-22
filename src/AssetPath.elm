module AssetPath exposing (Asset(..), url)

{-| The core API of `AssetPath`: a union type and a function.

@docs Asset, url

-}


{-| Tag a path to a static asset as such.
-}
type Asset
    = Asset String


{-| Get the URL of an asset.
-}
url : Asset -> String
url (Asset string) =
    string
