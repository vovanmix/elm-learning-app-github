module Commands exposing (..)

import RepoList.Commands exposing (fetchRepos)
import Messages exposing (Msg)


initialCommand : Cmd Msg
initialCommand =
    fetchRepos
