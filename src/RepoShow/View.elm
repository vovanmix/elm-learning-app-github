module RepoShow.View exposing (..)

import Html exposing (Html, text, h1, div)
import Models exposing (Repo)


-- try to put branches and PRs under repo and pass only a repo here?


view : Maybe Repo -> Html msg
view repo =
    case repo of
        Just a ->
            div []
                [ h1 []
                    [ text a.name ]
                ]

        Nothing ->
            text "404"
