module Models exposing (..)

import Routing


type alias Model =
    { route : Maybe Routing.Route
    }


initialModel : Maybe Routing.Route -> Model
initialModel route =
    { route = route
    }
