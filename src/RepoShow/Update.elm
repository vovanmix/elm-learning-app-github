module RepoShow.Update exposing (..)

import Models exposing (..)
import Messages exposing (..)
import RepoShow.Commands exposing (..)


updateRepo : Model -> String -> ( Model, Cmd Msg )
updateRepo model repoName =
    let
        selectedRepo =
            List.filter (\repo -> repo.name == repoName) model.repos |> List.head

        cmd =
            case selectedRepo of
                Just repo ->
                    RepoShow.Commands.fetchData repo

                Nothing ->
                    Cmd.none

        -- change route to 404 if Nothing?
    in
        ( { model | repo = selectedRepo }, cmd )
