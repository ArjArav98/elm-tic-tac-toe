module Index exposing (..)
import Browser
import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)

main = Browser.sandbox { update = update, view = view, init = init }

-- MODEL
-- We have store the user turn and state of the board.

type alias Board = List (List Int)
type UserTurn = PlayerOne | PlayerTwo
type alias Model = { board : Board, turn : UserTurn }

init : Model
init = {
        board : [[0,0,0],[0,0,0],[0,0,0]],
        turn : PlayerOne
    }

-- UPDATE

type Action = CellClicked Int Int

update : Model -> Action -> Model
update model action =
    case Action of
        CellClicked row col ->
            


-- VIEW
-- We need to visualise the board and display which player's turn it is.

view : Model -> Html msg
view model = 
    div [] [
        button [onClick "2"] [],
        text (String.fromInt model)
    ]
