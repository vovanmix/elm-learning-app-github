module Main exposing (..)

import Navigation
import Messages exposing (Msg)
import Models exposing (..)
import Update
import Subscriptions
import View
import Routing
import Commands exposing (initialCommand)


main : Program Never Model Msg
main =
    Navigation.program Messages.LocationChanged
        { init = init
        , update = Update.update
        , view = View.view
        , subscriptions = Subscriptions.subscriptions
        }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.init location
    in
        ( initialModel currentRoute, initialCommand )



--  ( initialModel currentRoute, fetchPlayers )
