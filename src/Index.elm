module Index exposing (..)
import Browser
import Html exposing (Html, button, div, text, Attribute)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)

main =
  Browser.sandbox { init = 0, update = update, view = view }

type Msg = Increment | Decrement | Double

update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

    Double ->
      model * 2


formStyle: List (Attribute msg)
formStyle = [ style "background-color" "black",
              style "color" "white",
              style "width" "7%",
              style "padding" "1% 0%" ]

view model =
  div []
    [ button [ text "-" ]
    , div formStyle [ text (String.fromInt model) ]
    , button [] [ text "+" ]
    , button [] [text "*2" ]
    ]
