module Styles exposing (..)
import Html exposing (Html)
import Html.Attributes exposing (style)

--
-- BOARD STYLES
--

boardStyles : List (Html.Attribute msg)
boardStyles = [
        style "display" "block",
        style "width" "40%",
        style "margin" "0 auto",
        style "padding" "0",
        style "background-color" "orange"
    ]

boardTileStyles : List (Html.Attribute msg)
boardTileStyles = [
        style "display" "inline-block",
        style "width" "33%",
        style "margin" "0",
        style "padding" "0"
    ]
