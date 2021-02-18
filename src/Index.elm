module Index exposing (..)

import Browser
import Array exposing (Array) 
import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style, attribute)

import Board exposing (..)
import UserTurn exposing (..)
import Styles exposing (..) 


main = Browser.sandbox { init = init, update = update, view = view }


--
-- MODEL
-- We have store the user turn and state of the board.


type alias Model = { board : Board, turn : UserTurn }


init : Model
init = {
        board = Array.repeat 3 (Array.repeat 3 0),
        turn = PlayerOne
    }

--
-- UPDATE


type Action = CellClicked Int Int


update : Action -> Model -> Model
update action model =
    case action of
        CellClicked row col ->
            Model (modifyBoard row col model.turn model.board) (getNextPlayer model.turn) 


--
-- UTILITY FUNCTIONS
-- Functions which help with our application logic.




--
-- VIEW
-- We need to visualise the board and display which player's turn it is.


view : Model -> Html Action
view model = 
    div boardStyles [
        div [onClick (CellClicked 0 0)] [text (getDisplayCharacter <| getCellValueFromBoard 0 0 model.board)],
        div [onClick (CellClicked 0 1)] [text (getDisplayCharacter <| getCellValueFromBoard 0 1 model.board)],
        div [onClick (CellClicked 0 2)] [text (getDisplayCharacter <| getCellValueFromBoard 0 2 model.board)],
        div [onClick (CellClicked 1 0)] [text (getDisplayCharacter <| getCellValueFromBoard 1 0 model.board)],
        div [onClick (CellClicked 1 1)] [text (getDisplayCharacter <| getCellValueFromBoard 1 1 model.board)],
        div [onClick (CellClicked 1 2)] [text (getDisplayCharacter <| getCellValueFromBoard 1 2 model.board)],
        div [onClick (CellClicked 2 0)] [text (getDisplayCharacter <| getCellValueFromBoard 2 0 model.board)],
        div [onClick (CellClicked 2 1)] [text (getDisplayCharacter <| getCellValueFromBoard 2 1 model.board)],
        div [onClick (CellClicked 2 2)] [text (getDisplayCharacter <| getCellValueFromBoard 2 2 model.board)]
    ]
