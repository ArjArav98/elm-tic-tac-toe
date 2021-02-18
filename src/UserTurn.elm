module UserTurn exposing (..)

--
-- TYPES
--

type UserTurn = PlayerOne | PlayerTwo

--
-- FUNCTIONS
--

getNextPlayer : UserTurn -> UserTurn
getNextPlayer userTurn =
    case userTurn of
        PlayerOne ->
            PlayerTwo
        PlayerTwo ->
            PlayerOne

getPlayerTurnMessage : UserTurn -> String
getPlayerTurnMessage player =
    case player of
        PlayerOne ->
            "Player 1 (X)"
        PlayerTwo ->
            "Player 2 (O)"
