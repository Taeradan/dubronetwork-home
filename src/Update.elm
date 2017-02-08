module Update exposing (..)

import Model exposing (Model)


type Msg
    = UpdateState
    | NewState Model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateState -> (model, Cmd.none)
        NewState newModel -> (newModel, Cmd.none)
