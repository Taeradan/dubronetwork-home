module Main exposing (..)

import Html
import Init exposing (init)
import Model exposing (Model)
import Time
import Update exposing (Msg(UpdateLinkStates), update)
import View exposing (view)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions m =
    Time.every (m.configuration.timerValue * m.configuration.timerUnit) (\x -> UpdateLinkStates)
