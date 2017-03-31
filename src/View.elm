module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Models exposing (..)
import Routing
import About
import Repos


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


view : Model -> Html msg
view model =
    div []
        [ navigationView model
        , body model
        ]


body : Model -> Html msg
body model =
    case model.route of
        Just (Routing.Home) ->
            About.view

        Just (Routing.Repo id) ->
            text <| "Repo #" ++ id ++ " page"

        Just (Routing.Repos) ->
            Repos.view model.repos

        Nothing ->
            text "404 Not Found!"
