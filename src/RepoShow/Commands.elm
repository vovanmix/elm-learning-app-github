module RepoShow.Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, requiredAt, optional)
import Messages exposing (Msg)
import Models exposing (Repo, Branch, PullRequest)


fetchData : Repo -> Cmd Msg
fetchData repo =
    Cmd.batch [ fetchBranches repo, fetchPRs repo ]


fetchBranches : Repo -> Cmd Msg
fetchBranches repo =
    let
        url =
            "https://api.github.com/repos/vovanmix/" ++ repo.name ++ "/branches"
    in
        Http.get url branchesDecoder
            |> Http.send branchesResponseHandler


fetchPRs : Repo -> Cmd Msg
fetchPRs repo =
    let
        url =
            "https://api.github.com/repos/vovanmix/" ++ repo.name ++ "/pulls"
    in
        Http.get url prsDecoder
            |> Http.send prsResponseHandler


branchesResponseHandler : Result Http.Error (List Branch) -> Msg
branchesResponseHandler response =
    case response of
        Ok list ->
            Messages.BranchesLoaded list

        Err _ ->
            Messages.GeneralError "Failed to fetch repos!"


branchesDecoder : Decode.Decoder (List Branch)
branchesDecoder =
    let
        branchDecoder =
            decode Branch
                |> required "name" Decode.string
                |> requiredAt [ "commit", "sha" ] Decode.string
    in
        Decode.list branchDecoder


prsResponseHandler : Result Http.Error (List PullRequest) -> Msg
prsResponseHandler response =
    case response of
        Ok list ->
            Messages.PullRequestsLoaded list

        Err _ ->
            Messages.GeneralError "Failed to fetch repos!"


prsDecoder : Decode.Decoder (List PullRequest)
prsDecoder =
    let
        branchDecoder =
            decode PullRequest
                |> required "number" Decode.int
                |> requiredAt [ "user", "login" ] Decode.string
                |> requiredAt [ "user", "avatar_url" ] Decode.string
                |> required "title" Decode.string
                |> required "state" Decode.string
                |> optional "body" Decode.string ""
                |> required "html_url" Decode.string
    in
        Decode.list branchDecoder
