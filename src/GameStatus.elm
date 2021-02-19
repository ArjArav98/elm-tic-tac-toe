module GameStatus exposing (..)
import Player exposing (..)
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


getPlayerWhoHasWon : Board -> Int -> Int -> Int -> Int
getPlayerWhoHasWon board rowNumber colNumber currentPlayerNumber =
    let
        horizontalWinner = getPlayerWhoHasWonHorizontally board rowNumber colNumber currentPlayerNumber
        verticalWinner = getPlayerWhoHasWonVertically board rowNumber colNumber currentPlayerNumber
        diagonalWinner = getPlayerWhoHasWonDiagonally board currentPlayerNumber
    in
    if (horizontalWinner /= -1) then
        horizontalWinner
    else if (verticalWinner /= -1) then
        verticalWinner
    else if (diagonalWinner /= -1) then
        diagonalWinner
    else
        -1


getPlayerWhoHasWonHorizontally : Board -> Int -> Int -> Int -> Int
getPlayerWhoHasWonHorizontally board rowNumber colNumber currentPlayerNumber =
    let
        currentCellValue = getCellValueFromBoard rowNumber colNumber board
    in
    if (rowNumber < 0) then
        if (currentPlayerNumber == 0) then
            -1
        else
            getPlayerWhoHasWonHorizontally board 2 2 (currentPlayerNumber-1)
    else if(colNumber < 0) then
        currentPlayerNumber
    else if (currentCellValue == currentPlayerNumber) then
        if (currentPlayerNumber == 0) then
            -1
        else
            getPlayerWhoHasWonHorizontally board rowNumber (colNumber-1) currentPlayerNumber
    else
        getPlayerWhoHasWonHorizontally board (rowNumber-1) 2 currentPlayerNumber

getPlayerWhoHasWonVertically : Board -> Int -> Int -> Int -> Int
getPlayerWhoHasWonVertically board rowNumber colNumber currentPlayerNumber =
    let
        currentCellValue = getCellValueFromBoard rowNumber colNumber board
    in
    if (colNumber < 0) then
        if (currentPlayerNumber == 0) then
            -1
        else
            getPlayerWhoHasWonVertically board 2 2 (currentPlayerNumber-1)
    else if(rowNumber < 0) then
        currentPlayerNumber
    else if (currentCellValue == currentPlayerNumber) then
        if (currentPlayerNumber == 0) then
            -1
        else
            getPlayerWhoHasWonVertically board (rowNumber-1) colNumber currentPlayerNumber
    else
        getPlayerWhoHasWonVertically board 2 (colNumber-1) currentPlayerNumber


getPlayerWhoHasWonDiagonally : Board -> Int -> Int
getPlayerWhoHasWonDiagonally board currentPlayerNumber =
    let
        bottomLeft = ((getCellValueFromBoard 2 0 board) == currentPlayerNumber)
        topLeft = ((getCellValueFromBoard 0 0 board) == currentPlayerNumber)
        center = ((getCellValueFromBoard 1 1 board) == currentPlayerNumber)
        topRight = ((getCellValueFromBoard 0 2 board) == currentPlayerNumber)
        bottomRight = ((getCellValueFromBoard 2 2 board) == currentPlayerNumber)
        player = getPlayerFromNumber currentPlayerNumber

    in

    if (currentPlayerNumber == 0) then
        -1
    else if ( bottomLeft && center && topRight ) then
        currentPlayerNumber
    else if ( bottomRight && center && topLeft ) then
        currentPlayerNumber
    else
        getPlayerWhoHasWonDiagonally board (currentPlayerNumber-1)
