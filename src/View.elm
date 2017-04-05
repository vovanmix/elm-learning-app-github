module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (..)
import Routing
import About
import RepoList.View as RepoListView
import RepoShow.View as RepoShowView


view : Model -> Html msg
view model =
    div []
        [ navigationView model
        , body model
        ]


links : List ( Routing.Route, String )
links =
    [ ( Routing.Home, "Home" )
    , ( Routing.Repos, "Repos" )
    ]


navigationView : Model -> Html msg
navigationView model =
    let
        linkListItem linkData =
            li [] [ link linkData ]
    in
        nav []
            [ ul []
                (List.map linkListItem links)
            ]


link : ( Routing.Route, String ) -> Html msg
link ( route, label ) =
    a [ href <| Routing.urlFor route ] [ text label ]


body : Model -> Html msg
body model =
    case model.route of
        Just (Routing.Home) ->
            About.view

        Just (Routing.Repo id) ->
            RepoShowView.view model.repo

        Just (Routing.Repos) ->
            RepoListView.view model.repos

        Nothing ->
            text "404 Not Found!"
