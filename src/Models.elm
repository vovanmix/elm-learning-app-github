module Models exposing (..)

import Routing
import RemoteData exposing (WebData)


type alias Model =
    { route : Maybe Routing.Route
    , repos : WebData (List Repo)
    }


initialModel : Maybe Routing.Route -> Model
initialModel route =
    { route = route
    , repos = RemoteData.Loading
    }


type alias Repo =
    { id : Int
    , name : String
    , fullName : String
    , description : String
    , htmlUrl : String
    , url : String
    }
