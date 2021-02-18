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
        style "box-shadow" "0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)",
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
        style "width" "40%",
        style "margin" "5% 0% 0% 5%",
        style "padding" "0",
        style "border" "5px solid black",
        style "border-radius" "4px",
        style "vertical-align" "top"
    ]

boardTileStyles : List (Html.Attribute msg)
boardTileStyles = [
        style "display" "inline-block",
        style "width" "32.55%",
        style "margin" "0",
        style "padding" "0",
        style "font-size" "150%",
        style "text-align" "center",
        style "border" "3px solid black",
        style "cursor" "pointer"
    ]

boardTileImgStyles : List (Html.Attribute msg)
boardTileImgStyles = [
        style "width" "40%",
        style "margin" "30%",
        style "padding" "0"
    ]
