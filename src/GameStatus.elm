module GameStatus exposing (..)
import Player exposing (Player)
import Board exposing (Board, getCellValueFromBoard)

--
-- TYPES
--

type GameStatus = Not_Started | Finished Player | In_Progress

--
-- FUNCTIONS
--

getGameStatus : GameStatus -> String
getGameStatus status =
    case status of
        In_Progress -> "in progress"
        Finished player -> "finished"
        Not_Started -> "not started"


anyPlayerHasWonHorizontally : Board -> Int -> Int -> Int -> Bool
anyPlayerHasWonHorizontally board rowNumber colNumber currentPlayerNumber =
    if (rowNumber < 0) then
        if (currentPlayerNumber == 0) then
            False
        else
            anyPlayerHasWonHorizontally board 2 2 (currentPlayerNumber-1)
    else if(colNumber < 0) then
        True
    else if ((getCellValueFromBoard rowNumber colNumber board) == currentPlayerNumber) then
        if (currentPlayerNumber == 0) then
            False
        else
            anyPlayerHasWonHorizontally board rowNumber (colNumber-1) currentPlayerNumber
    else
        anyPlayerHasWonHorizontally board (rowNumber-1) 2 currentPlayerNumber

anyPlayerHasWonVertically : Board -> Int -> Int -> Int -> Bool
anyPlayerHasWonVertically board rowNumber colNumber currentPlayerNumber =
    if (colNumber < 0) then
        if (currentPlayerNumber == 0) then
            False
        else
            anyPlayerHasWonVertically board 2 2 (currentPlayerNumber-1)
    else if(rowNumber < 0) then
        True
    else if ((getCellValueFromBoard rowNumber colNumber board) == currentPlayerNumber) then
        if (currentPlayerNumber == 0) then
            False
        else
            anyPlayerHasWonVertically board (rowNumber-1) colNumber currentPlayerNumber
    else
        anyPlayerHasWonVertically board 2 (colNumber-1) currentPlayerNumber


anyPlayerHasWonDiagonally : Board -> Int -> Bool
anyPlayerHasWonDiagonally board currentPlayerNumber =
    let
        bottomLeft = ((getCellValueFromBoard 2 0 board) == currentPlayerNumber)
        topLeft = ((getCellValueFromBoard 0 0 board) == currentPlayerNumber)
        center = ((getCellValueFromBoard 1 1 board) == currentPlayerNumber)
        topRight = ((getCellValueFromBoard 0 2 board) == currentPlayerNumber)
        bottomRight = ((getCellValueFromBoard 2 2 board) == currentPlayerNumber)
    in
    if (currentPlayerNumber == 0) then
        False
    else if ( bottomLeft && center && topRight ) then
        True
    else if ( bottomRight && center && topLeft ) then
        True
    else
        anyPlayerHasWonDiagonally board (currentPlayerNumber-1)
