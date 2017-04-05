module Models exposing (..)

import Routing


type alias Model =
    { route : Maybe Routing.Route
    , repos : List Repo
    , repo : Maybe Repo
    , branches : List Branch
    , branch : Maybe Branch
    , commits : List Commit
    , pullRequests : List PullRequest
    , errorMessage : Maybe String
    }


initialModel : Maybe Routing.Route -> Model
initialModel route =
    { route = route
    , repos = []
    , repo = Nothing
    , branches = []
    , branch = Nothing
    , commits = []
    , pullRequests = []
    , errorMessage = Nothing
    }


type alias Repo =
    { name : String
    , fullName : String
    , description : String
    , url : String
    }


type alias Branch =
    { name : String, sha : String }


type alias Commit =
    { sha : String
    , author : String
    , avatar : String
    }


type alias PullRequest =
    { number : Int
    , author : String
    , avatar : String
    , title : String
    , state : String
    , body : String
    , url : String
    }



--labels
