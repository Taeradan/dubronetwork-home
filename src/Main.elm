module Main exposing (..)

import Html exposing (Html)
import Model exposing (Model, dubronetworkInit)
import Time exposing (second)
import Update exposing (Msg(UpdateState), update)
import View exposing (view)


main : Program Never Model.Model Update.Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( dubronetworkInit, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions m =
    Time.every (10 * second) (\x -> UpdateState)
