module Update exposing (..)

import Http
import List exposing (concatMap, map)
import Model exposing (..)
import Platform.Cmd exposing (batch)


type Msg
    = UpdateState
    | NewState Model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateState ->
            ( model, updateState model )

        NewState newModel ->
            ( newModel, Cmd.none )


updateState : Model -> Cmd Msg
updateState model =
    let
        updateSection m_section =
            concatMap updateSubsection m_section.subsections

        updateSubsection m_subsection =
            map updateLink m_subsection.links

        updateLink m_link =
            Http.send (\x -> NewState model) <| Http.getString m_link.url
    in
        batch (concatMap updateSection model.pageStructure)
