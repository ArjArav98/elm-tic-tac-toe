module Styles exposing (..)
import Html exposing (Html)
import Html.Attributes exposing (style)

--
-- SCREEN STYLES
--

screenStyles : List (Html.Attribute msg)
screenStyles = [
        style "display" "block",
        style "width" "100%",
        style "margin" "0",
        style "padding" "0"
    ]


--
-- SETTINGS STYLES
--

settingsStyles : List (Html.Attribute msg)
settingsStyles = [
        style "display" "inline-block",
        style "width" "30%",
        style "margin" "5% 0% 0% 5%",
        style "padding" "1%",
        style "border-radius" "3px",
        style "background-color" "#FFECB3",
        style "vertical-align" "top",
        style "text-align" "center",
        style "font-family" "Verdana"
    ]


--
-- BOARD STYLES
--

boardStyles : List (Html.Attribute msg)
boardStyles = [
        style "display" "inline-block",
        style "width" "35%",
        style "margin" "5% 0% 0% 5%",
        style "padding" "0",
        style "vertical-align" "top"
    ]

boardTileStyles : List (Html.Attribute msg)
boardTileStyles = [
        style "display" "inline-block",
        style "width" "32.50%",
        style "margin" "0",
        style "padding" "0",
        style "font-size" "150%",
        style "text-align" "center",
        style "cursor" "pointer"
    ]

boardTileImgStyles : List (Html.Attribute msg)
boardTileImgStyles = [
        style "width" "40%",
        style "margin" "30%",
        style "padding" "0"
    ]
