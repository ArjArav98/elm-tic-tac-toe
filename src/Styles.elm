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
        style "margin" "5% auto 0% auto",
        style "padding" "0",
        style "border" "5px solid black",
        style "border-radius" "4px"
    ]

boardTileStyles : List (Html.Attribute msg)
boardTileStyles = [
        style "display" "inline-block",
        style "width" "33.075%",
        style "margin" "0",
        style "padding" "0",
        style "font-size" "150%",
        style "text-align" "center",
        style "border" "1px solid black"
    ]

boardTileImgStyles : List (Html.Attribute msg)
boardTileImgStyles = [
        style "width" "40%",
        style "margin" "30%",
        style "padding" "0"
    ]
