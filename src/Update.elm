module Update exposing (..)

import Messages exposing (..)
import Models exposing (..)
import Routing
import RepoShow.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LocationChanged location ->
            let
                newRoute =
                    Routing.parseLocation location

                updatedModel =
                    { model | route = newRoute }
            in
                loadPage updatedModel

        ReposLoaded newRepos ->
            let
                updatedModel =
                    { model | repos = newRepos }
            in
                loadPage updatedModel

        BranchesLoaded newBranches ->
            ( { model | branches = newBranches }, Cmd.none )

        PullRequestsLoaded newPRs ->
            ( { model | pullRequests = newPRs }, Cmd.none )

        GeneralError message ->
            ( { model | errorMessage = Just message }, Cmd.none )


loadPage : Model -> ( Model, Cmd Msg )
loadPage model =
    case model.route of
        Just (Routing.Home) ->
            ( model, Cmd.none )

        Just (Routing.Repo name) ->
            RepoShow.Update.updateRepo model name

        Just (Routing.Repos) ->
            ( model, Cmd.none )

        Nothing ->
            ( model, Cmd.none )
