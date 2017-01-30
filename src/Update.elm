module Update exposing (..)

import Model exposing (Model)


type Msg
    = None


update : Msg -> Model -> Model
update msg model =
    model
