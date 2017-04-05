module RepoShow.Update exposing (..)

import Models exposing (..)
import Messages exposing (..)
import RepoShow.Commands exposing (..)
import Debug


updateRepo : Model -> String -> ( Model, Cmd Msg )
updateRepo model repoName =
    let
        selectedRepo =
            Debug.log (List.length model.repos |> toString) List.filter (\repo -> Debug.log repoName repo.name == repoName) model.repos |> List.head

        cmd =
            case selectedRepo of
                Just repo ->
                    RepoShow.Commands.fetchData repo

                Nothing ->
                    Cmd.none

        -- change route to 404 if Nothing?
    in
        ( { model | repo = selectedRepo }, cmd )
