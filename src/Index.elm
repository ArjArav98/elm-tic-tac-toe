module Index exposing (..)
import Browser
import Array exposing (Array) 
import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)


main = Browser.sandbox { init = init, update = update, view = view }


--
-- MODEL
-- We have store the user turn and state of the board.


type alias Board = Array (Array Int)
type UserTurn = PlayerOne | PlayerTwo
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

modifyBoard : Int -> Int -> UserTurn -> Board -> Board
modifyBoard row col userTurn board = 
    case userTurn of
        PlayerOne ->
            fillBoardWith row col 1 board
        PlayerTwo ->
            fillBoardWith row col 2 board
         

fillBoardWith : Int -> Int -> Int -> Board -> Board
fillBoardWith row col characterNum board =
    Array.set row (Array.set col characterNum <| extractRowValue <| Array.get row board) board


extractCellValue : Maybe Int -> Int
extractCellValue result =
    case result of
        Just value ->
            value
        Nothing ->
            -1


extractRowValue : Maybe (Array Int) -> Array Int
extractRowValue result =
    case result of
        Just value ->
            value
        Nothing ->
            Array.fromList [0,0,0]


getNextPlayer : UserTurn -> UserTurn
getNextPlayer userTurn =
    case userTurn of
        PlayerOne ->
            PlayerTwo
        PlayerTwo ->
            PlayerOne


--
-- VIEW
-- We need to visualise the board and display which player's turn it is.


view : Model -> Html Action
view model = 
    div [] [
        button [onClick (CellClicked 1 2)] [text "+"]
    ]
