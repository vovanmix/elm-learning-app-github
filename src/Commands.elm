module Commands exposing (..)

import Messages exposing (Msg)


fetchPlayers : Cmd Msg
fetchPlayers =
    Cmd.none



--     Http.get fetchPlayersUrl playersDecoder
--         |> RemoteData.sendRequest
-- |> Cmd.map Msgs.OnFetchPlayers
