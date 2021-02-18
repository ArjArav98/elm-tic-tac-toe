module Index exposing (..)

import Browser
import Array exposing (Array) 
import Html exposing (Html, div, button, text, p, h1, h3)
import Html.Attributes exposing (style, attribute)

import Board exposing (..)
import Player exposing (..)
import Styles exposing (..) 
import Action exposing (..)
import GameStatus exposing (..)


--
-- MAIN
--


main = Browser.sandbox { init = init, update = update, view = view }


--
-- MODEL
-- We have store the user turn and state of the board.


type alias Model = {
        board : Board,
        turn : Player,
        status: GameStatus
    }


init : Model
init = {
        board = Array.repeat 3 (Array.repeat 3 0),
        turn = PlayerOne,
        status = Not_Started
    }

--
-- UPDATE


update : Action -> Model -> Model
update action model =
    case action of
        CellClicked row col ->
            Model (modifyBoard row col model.turn model.board) (getNextPlayer model.turn) In_Progress


--
-- VIEW
-- We need to visualise the board and display which player's turn it is.


view : Model -> Html Action
view model = 
    div screenStyles [
        div settingsStyles [
            h1 [] [text "Welcome!"],
            h3 [] [text ((getPlayerTurnMessage model.turn) ++ ", your turn.")]
        ],
        div boardStyles (generateBoard 2 2 3 model.board Array.empty)
    ] 
