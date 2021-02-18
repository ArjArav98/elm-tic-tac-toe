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
