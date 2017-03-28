module Routing exposing (..)

import Navigation
import UrlParser exposing (..)


type alias TopicId =
    String


type Route
    = Home
    | Topic TopicId
    | Topics


init : Navigation.Location -> Maybe Route
init location =
    parseLocation location


parseLocation : Navigation.Location -> Maybe Route
parseLocation location =
    parseHash matchers location


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map Home top
        , map Topic (s "topics" </> string)
        , map Topics (s "topics")
        ]


urlFor : Route -> String
urlFor route =
    let
        url =
            case route of
                Home ->
                    "/"

                Topic id ->
                    "/topics/" ++ id

                Topics ->
                    "topics"
    in
        "#" ++ url
