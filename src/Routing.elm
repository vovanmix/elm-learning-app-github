module Routing exposing (..)

import Navigation
import UrlParser exposing (..)


type Route
    = Home
    | Repo String
    | Repos


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
        , map Repo (s "repos" </> string)
        , map Repos (s "repos")
        ]


urlFor : Route -> String
urlFor route =
    let
        url =
            case route of
                Home ->
                    "/"

                Repo id ->
                    "/repos/" ++ id

                Repos ->
                    "repos"
    in
        "#" ++ url
