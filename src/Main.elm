module Main exposing (..)

import Navigation
import Messages exposing (Msg)
import Models exposing (..)
import Update
import Subscriptions
import View
import Routing


main : Program Never Model Msg
main =
    Navigation.program Messages.OnLocationChange
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
        ( initialModel currentRoute, Cmd.none )



--  ( initialModel currentRoute, fetchPlayers )
