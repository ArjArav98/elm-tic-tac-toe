module Board exposing (..)
import Array exposing (Array) 
import UserTurn exposing (..)

--
-- TYPES
--

type alias Board = Array (Array Int)

--
-- FUNCTIONS
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


getCellValueFromBoard : Int -> Int -> Board -> Int
getCellValueFromBoard row col board = 
    extractCellValue <| Array.get col (extractRowValue <| Array.get row board)


getDisplayCharacter : Int -> String
getDisplayCharacter charNum =
    if charNum == 1 then
        "X"
    else if charNum == 2 then
        "O"
    else
        "."


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
