module Main exposing (..)

import Html exposing (Html)
import Model exposing (model)
import Update exposing (update)
import View exposing (view)


main : Program Never Model.Model Update.Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
