module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, optional)
import Messages exposing (Msg)
import Models exposing (Repo)
import RemoteData


fetchRepos : Cmd Msg
fetchRepos =
    Http.get fetchReposUrl reposDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Messages.OnFetchRepos


fetchReposUrl : String
fetchReposUrl =
    "https://api.github.com/users/vovanmix/repos?sort=updated"


reposDecoder : Decode.Decoder (List Repo)
reposDecoder =
    Decode.list repoDecoder


repoDecoder : Decode.Decoder Repo
repoDecoder =
    decode Repo
        |> required "id" Decode.int
        |> required "name" Decode.string
        |> required "full_name" Decode.string
        |> optional "description" Decode.string ""
        |> required "html_url" Decode.string
        |> required "url" Decode.string
