module Board exposing (..)
import Html exposing (Html, div, text, img)
import Html.Events exposing (onClick)
import Html.Attributes exposing (src, style)
import Array exposing (Array) 
import Player exposing (..)
import Action exposing (..)
import Styles exposing (..)

--
-- TYPES
--

type alias Board = Array (Array Int)

emptyBoard : Board
emptyBoard = Array.fromList [Array.fromList [-1,0,-1],Array.fromList [0,-1,0], Array.fromList [-1,0,-1]]

--
-- FUNCTIONS
--

--
-- GENERATION
--

generateBoard : Int -> Int -> Int -> Board -> Array (Html Action) -> List (Html Action)
generateBoard row col sideLength board divArray =
    let
        displayCharacter = getDisplayCharacterImgLink <| getCellValueFromBoard row col board
        displayCharacterBg = getDisplayCharacterBgColor <| getCellValueFromBoard row col board

        divAttributes = [
                onClick (CellClicked row col),
                style "background-color" displayCharacterBg
            ] ++ boardTileStyles
        imgAttributes = [src displayCharacter] ++ boardTileImgStyles

        generatedDiv = div divAttributes [img imgAttributes []]

    in

    if (row < 0) then
        Array.toList divArray
    else if (col == 0) then
        generateBoard (row-1) (sideLength-1) sideLength board (
                Array.push generatedDiv divArray
            )
    else
        generateBoard row (col-1) sideLength board (
            Array.push generatedDiv divArray
        )


--
-- MANIPULATION
--

modifyBoard : Int -> Int -> Player -> Board -> Board
modifyBoard row col currentPlayer board = 
    case currentPlayer of
        PlayerOne ->
            fillBoardWith row col 1 board
        PlayerTwo ->
            fillBoardWith row col 2 board
         

fillBoardWith : Int -> Int -> Int -> Board -> Board
fillBoardWith row col characterNum board =
    Array.set row (Array.set col characterNum <| extractRowValue <| Array.get row board) board


--
-- QUERYING
--

boardIsFull : Int -> Int -> Board -> Bool
boardIsFull row col board =
    let
        cellValue = getCellValueFromBoard row col board
    in
    if row < 0 then
        True
    else if col < 0 then
        boardIsFull (row-1) 2 board
    else if cellValue < 1 then
        False
    else
        boardIsFull row (col-1) board


boardCellIsEmpty : Int -> Int -> Board -> Bool
boardCellIsEmpty row col board =
    (getCellValueFromBoard row col board) <= 0

getCellValueFromBoard : Int -> Int -> Board -> Int
getCellValueFromBoard row col board = 
    extractCellValue <| Array.get col (extractRowValue <| Array.get row board)


getDisplayCharacterImgLink : Int -> String
getDisplayCharacterImgLink charNum =
    if charNum == 1 then
        "assets/img/x.png"
    else if charNum == 2 then
        "assets/img/o.png"
    else
        "assets/img/background.png"

getDisplayCharacterBgColor : Int -> String
getDisplayCharacterBgColor charNum =
    if charNum == 1 then
        "#2196f3"
    else if charNum == 2 then
        "orange"
    else if charNum == 0 then
        "#E3F2FD"
    else
        "#BBDEFB"


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
