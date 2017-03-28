module Main exposing (..)

import Html exposing (program)
import Task
import Update
import Types exposing (..)
import Subscriptions
import View


main =
    program
        { init = ( init, initCmds )
        , update = Update.update
        , view = View.view
        , subscriptions = Subscriptions.subscriptions
        }


init : Model
init =
    {}
