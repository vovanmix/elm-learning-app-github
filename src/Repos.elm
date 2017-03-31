module Repos exposing (..)

import Html exposing (Html, text, h1, div)
import Html.Attributes exposing (class)
import RemoteData exposing (WebData)
import Models exposing (Repo)


view : WebData (List Repo) -> Html msg
view response =
    div []
        [ h1 []
            [ text "My repos" ]
        , maybeList response
        ]


maybeList : WebData (List Repo) -> Html msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success repos ->
            list repos

        RemoteData.Failure error ->
            error |> toString |> text


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
