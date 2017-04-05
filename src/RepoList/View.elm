module RepoList.View exposing (..)

import Html exposing (Html, text, h1, div, a, ul, li, span)
import Html.Attributes exposing (class, href)
import Models exposing (Repo)
import Routing


view : List Repo -> Html msg
view repos =
    div []
        [ h1 []
            [ text "My repos" ]
        , list repos
        ]


list : List Repo -> Html msg
list repos =
    ul [ class "mdl-list" ]
        ([ text "Total: " ]
            ++ [ text <|
                    toString <|
                        List.length repos
               ]
            ++ List.map listItem repos
        )


listItem : Repo -> Html msg
listItem repo =
    li [ class "mdl-list__item" ]
        [ span [ class "mdl-list__item-primary-content" ]
            [ a [ href <| Routing.urlFor (Routing.Repo repo.name) ]
                [ text repo.name ]
            ]
        ]
