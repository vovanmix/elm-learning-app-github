module RepoList.View exposing (..)

import Html exposing (Html, text, h1, div)
import Html.Attributes exposing (class)
import Models exposing (Repo)


view : List Repo -> Html msg
view repos =
    div []
        [ h1 []
            [ text "My repos" ]
        , list repos
        ]


list : List Repo -> Html msg
list repos =
    div [ class "row" ]
        ([ text "Total: " ]
            ++ [ text <|
                    toString <|
                        List.length repos
               ]
            ++ List.map listItem repos
        )


listItem : Repo -> Html msg
listItem repo =
    div []
        [ text repo.name
        ]
