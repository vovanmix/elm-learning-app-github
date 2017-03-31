module Routing exposing (..)

import Navigation
import UrlParser exposing (..)


type alias RepoId =
    String


type Route
    = Home
    | Repo RepoId
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
        , map Repo (s "Repos" </> string)
        , map Repos (s "Repos")
        ]


urlFor : Route -> String
urlFor route =
    let
        url =
            case route of
                Home ->
                    "/"

                Repo id ->
                    "/Repos/" ++ id

                Repos ->
                    "Repos"
    in
        "#" ++ url
