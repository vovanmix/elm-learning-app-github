module Update exposing (..)

import Messages exposing (Msg)
import Models exposing (..)
import Routing


-- TODO: separate repos with fetching to a component


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Messages.OnLocationChange location ->
            let
                newRoute =
                    Routing.parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        Messages.OnFetchRepos response ->
            ( { model | repos = response }, Cmd.none )
