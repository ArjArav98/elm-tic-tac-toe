module Index exposing (..)

import Browser
import Array exposing (Array) 
import Html exposing (Html, div, button, text, p, h1, h3)
import Html.Attributes exposing (style, attribute)
import Html.Events exposing (onClick)

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

        -- Only if game is in progress must CellClicked execute.
        CellClicked row col ->
            case model.status of
                In_Progress ->
                    let
                        newBoard = modifyBoard row col model.turn model.board
                        gameWinner = getPlayerWhoHasWon newBoard 2 2 2
                    in
                    -- Only if cell is empty can we process the click.
                    if (boardCellIsEmpty row col model.board) then
                        if (gameWinner /= -1) then
                            Model newBoard (getNextPlayer model.turn) (Finished (getPlayerFromNumber gameWinner))
                        else
                            Model newBoard (getNextPlayer model.turn) In_Progress
                    else
                        model

                Finished winner -> model
                Not_Started -> model

        -- Game will start.
        Game_Started ->
            Model model.board model.turn In_Progress


--
-- VIEW
-- We need to visualise the board and display which player's turn it is.


view : Model -> Html Action
view model = 
    div screenStyles [
        div settingsStyles [
            h1 [] [text "Welcome!"],
            getGameStatusMessage model,
            getGameStartButton model
        ],
        div boardStyles (generateBoard 2 2 3 model.board Array.empty)
    ]

getGameStartButton : Model -> Html Action
getGameStartButton model =
    case model.status of
        Not_Started -> h3 [onClick Game_Started] [text "Start New Game!"]
        Finished winner -> h3 [onClick Game_Started] [text "Play another game!"]
        In_Progress -> h3 [] [text "Game is in progress."]


getGameStatusMessage : Model -> Html Action
getGameStatusMessage model =
    case model.status of
        Finished winner ->
            h3 [] [text (("The game has been won by ") ++ (getPlayerTurnMessage winner) ++ ". Congrats!")]
        In_Progress ->
            h3 [] [text ((getPlayerTurnMessage model.turn) ++ ", your turn.")]
        Not_Started ->
            h3 [] []
