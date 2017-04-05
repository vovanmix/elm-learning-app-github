module RepoShow.View exposing (..)

import Html exposing (Html, text, h1, h2, div)
import Html.Attributes exposing (class)
import Models exposing (Repo, Branch, PullRequest)


-- try to put branches and PRs under repo and pass only a repo here?


view : Maybe Repo -> List Branch -> List PullRequest -> Html msg
view repo branches pullRequests =
    case repo of
        Just a ->
            div []
                [ h1 []
                    [ text a.name ]
                , listBranches branches
                , listPRs pullRequests
                ]

        Nothing ->
            text "404"


listBranches : List Branch -> Html msg
listBranches branches =
    div [ class "row" ]
        ([ h2 []
            [ text "Branches" ]
         , text "Total: "
         ]
            ++ [ text <|
                    toString <|
                        List.length branches
               ]
            ++ List.map branchListItem branches
        )


branchListItem : Branch -> Html msg
branchListItem branch =
    div []
        [ text branch.name
        ]


listPRs : List PullRequest -> Html msg
listPRs pullRequests =
    div [ class "row" ]
        ([ h2 []
            [ text "Pull Requests" ]
         , text "Total: "
         ]
            ++ [ text <|
                    toString <|
                        List.length pullRequests
               ]
            ++ List.map prListItem pullRequests
        )


prListItem : PullRequest -> Html msg
prListItem pullRequest =
    div []
        [ text pullRequest.title
        ]
