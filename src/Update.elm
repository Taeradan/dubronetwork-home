module Update exposing (..)

import Dict
import Http
import List exposing (concatMap, map)
import Model exposing (..)
import Platform.Cmd exposing (batch)
import Time exposing (Time)


type Msg
    = UpdateLinkStates
    | NewLinkState ( LinkUrl, LinkState )
    | NewTimerValue Time
    | NewTimerUnit Time


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateLinkStates ->
            ( model, updateLinkStates model.linkStates )

        NewLinkState newLinkState ->
            ( applyLinkState model newLinkState, Cmd.none )

        NewTimerValue value ->
            ( model, Cmd.none )

        NewTimerUnit unit ->
            ( model, Cmd.none )


updateLinkStates : LinkStates -> Cmd Msg
updateLinkStates linkStates =
    batch << map sendRequest << Dict.keys <| linkStates


sendRequest : LinkUrl -> Cmd Msg
sendRequest url =
    Http.send (toLinkState url) <| Http.getString ("https://crossorigin.me/" ++ url)


toLinkState : LinkUrl -> Result Http.Error a -> Msg
toLinkState url result =
    case result of
        Err error ->
            NewLinkState ( url, Unreachable { error = error } )

        Ok _ ->
            NewLinkState ( url, Reachable )


applyLinkState : Model -> ( LinkUrl, LinkState ) -> Model
applyLinkState model ( linkUrl, linkState ) =
    { model | linkStates = Dict.insert linkUrl linkState model.linkStates }
