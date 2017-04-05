module RepoList.Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, optional)
import Messages exposing (Msg)
import Models exposing (Repo)


fetchRepos : Cmd Msg
fetchRepos =
    let
        url =
            "https://api.github.com/users/vovanmix/repos?sort=updated"
    in
        Http.get url reposDecoder
            |> Http.send reposResponseHandler


reposResponseHandler : Result Http.Error (List Repo) -> Msg
reposResponseHandler response =
    case response of
        Ok list ->
            Messages.ReposLoaded list

        Err _ ->
            Messages.GeneralError "Failed to fetch repos!"


reposDecoder : Decode.Decoder (List Repo)
reposDecoder =
    let
        repoDecoder =
            decode Repo
                |> required "name" Decode.string
                |> required "full_name" Decode.string
                |> optional "description" Decode.string ""
                |> required "html_url" Decode.string
    in
        Decode.list repoDecoder
