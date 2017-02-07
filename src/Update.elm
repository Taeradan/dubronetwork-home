module Update exposing (..)

import Model exposing (Model)


type Msg
    = UpdateState
    | NewState Model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )
