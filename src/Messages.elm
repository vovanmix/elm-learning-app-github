module Messages exposing (..)

import Navigation
import Models exposing (..)


type Msg
    = LocationChanged Navigation.Location
    | ReposLoaded (List Repo)
    | BranchesLoaded (List Branch)
    | PullRequestsLoaded (List PullRequest)
    | GeneralError String
