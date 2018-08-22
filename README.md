# AssetPath [![Build Status](https://travis-ci.org/NoRedInk/elm-asset-path.svg?branch=master)](https://travis-ci.org/NoRedInk/elm-asset-path)

Elm package for defining a typed asset path and obtaining its URL.

## Usage

```elm
import Html exposing (..)
import Html.Attributes exposing (..)
import AssetPath exposing(Asset(..))


viewStar : Html msg
viewStar =
    img [ src <| AssetPath.url <| Asset "/assets/star.png" ]
        []
```
