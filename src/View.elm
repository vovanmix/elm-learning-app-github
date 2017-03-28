module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Models exposing (..)
import About
import Routing


links : List ( Routing.Route, String )
links =
    [ ( Routing.Home, "Home" )
    , ( Routing.Topics, "Topics" )
    ]


navigationView : Model -> Html Msg
navigationView model =
    let
        linkListItem linkData =
            li [] [ link linkData ]
    in
        nav []
            [ ul []
                (List.map linkListItem links)
            ]


link : ( Routing.Route, String ) -> Html Msg
link ( route, label ) =
    a [ href <| Routing.urlFor route ] [ text label ]


view : Model -> Html Msg
view model =
    div []
        [ navigationView model
        , body model
        ]


body : Model -> Html Msg
body model =
    case model.route of
        Just (Routing.Home) ->
            About.view

        Just (Routing.Topic id) ->
            text <| "Topic #" ++ id ++ " page"

        Just (Routing.Topics) ->
            text "Topics page"

        Nothing ->
            text "404 Not Found!"
