module Messages exposing (..)

import Navigation
import Models exposing (Repo)
import RemoteData exposing (WebData)


type Msg
    = OnLocationChange Navigation.Location
    | OnFetchRepos (WebData (List Repo))
