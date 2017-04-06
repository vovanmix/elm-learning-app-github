module RepoShow.View exposing (..)

import Html exposing (Html, text, h1, h2, div)
import Html.Attributes exposing (class)
import Models exposing (Repo, Branch, PullRequest)


-- try to put branches and PRs under repo and pass only a repo here?
-- where is the best place to check that repo exists and handle the incorrect ID case?
-- Should we pass in the repo ID or the repo itself?
-- Not sure that picking the repo in the view is the best way?


view : String -> List Repo -> List Branch -> List PullRequest -> Html msg
view repoName repos branches pullRequests =
    let
        repo =
            List.filter (\repo -> repo.name == repoName) repos |> List.head
    in
        case repo of
            Just a ->
                repoPage a branches pullRequests

            Nothing ->
                text "404"


repoPage : Repo -> List Branch -> List PullRequest -> Html msg
repoPage repo branches pullRequests =
    div []
        [ h1 []
            [ text repo.name ]
        , listBranches branches
        , listPRs pullRequests
        ]


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
