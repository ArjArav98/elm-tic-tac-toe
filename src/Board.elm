module Board exposing (..)
import Html exposing (Html, div, text, img)
import Html.Events exposing (onClick)
import Html.Attributes exposing (src, style)
import Array exposing (Array) 
import UserTurn exposing (..)
import Action exposing (..)
import Styles exposing (..)

--
-- TYPES
--

type alias Board = Array (Array Int)

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


--
-- QUERYING
--


getCellValueFromBoard : Int -> Int -> Board -> Int
getCellValueFromBoard row col board = 
    extractCellValue <| Array.get col (extractRowValue <| Array.get row board)


getDisplayCharacterImgLink : Int -> String
getDisplayCharacterImgLink charNum =
    if charNum == 1 then
        "../assets/img/x.png"
    else if charNum == 2 then
        "../assets/img/o.png"
    else
        "../assets/img/o.png"

getDisplayCharacterBgColor : Int -> String
getDisplayCharacterBgColor charNum =
    if charNum == 1 then
        "green"
    else if charNum == 2 then
        "orange"
    else
        "white"


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
