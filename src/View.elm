module View exposing (..)

import Dict exposing (Dict)
import Html exposing (Html, a, body, br, dd, div, dl, dt, form, h1, h2, h3, header, input, node, option, p, section, select, span, text)
import Html.Attributes exposing (action, attribute, autofocus, class, content, href, id, lang, media, method, name, rel, title, type_, value)
import Html.Events exposing (onInput)
import List exposing (concat, concatMap, map)
import Model exposing (..)
import Result exposing (toMaybe)
import Time exposing (Time)
import Update exposing (Msg(SetTimerUnit, SetTimerValue))


view : Model -> Html Msg
view model =
    node "html"
        [ lang "fr" ]
        [ pageHead
        , pageBody model
        ]


pageHead : Html Msg
pageHead =
    node "head"
        []
        [ node "meta"
            [ content "text/html;charset=utf-8", attribute "http-equiv" "Content-Type" ]
            []
        , node "title"
            []
            [ text "Portail Dubronetwork" ]
        , node "link"
            [ href "/default.css", media "screen", rel "stylesheet", title "Style par défaut", type_ "text/css" ]
            []
        , node "script"
            [ type_ "text/javascript" ]
            [ text "document.getElementById('champ-recherche').focus();" ]
        ]


pageBody : Model -> Html Msg
pageBody m =
    body [] <| bodyHeader m :: printModel m


bodyHeader : Model -> Html Msg
bodyHeader m =
    header []
        [ h1 [] [ text "Portail Dubronetwork" ]
        , form [ action "http://duckduckgo.com", id "recherche", method "get" ]
            [ p []
                [ input [ id "champ-recherche", attribute "maxlength" "255", name "q", attribute "size" "31", type_ "text", value "" ]
                    []
                , text "            "
                , input [ type_ "submit", value "DuckDuckGo!" ] []
                , timerSelector m
                ]
            ]
        ]


timerSelector : Model -> Html Msg
timerSelector m =
    div []
        [ text "Refresh timer : "
        , input [ (value << toString <| m.configuration.timerValue), (onInput (SetTimerValue << (Maybe.withDefault m.configuration.timerValue) << Result.toMaybe << String.toFloat)) ] []
        , select [ onInput setTimerUnit ] (List.map (timerUnitOption m) <| Dict.toList timerUnits)
        ]


timerUnits : Dict String Time
timerUnits =
    Dict.fromList
        [ ( "seconds", Time.second )
        , ( "minutes", Time.minute )
        ]


timerUnitOption : Model -> ( String, Time ) -> Html Msg
timerUnitOption m ( k, v ) =
    option
        ([ value k ]
            ++ if v == m.configuration.timerUnit then
                [ autofocus True ]
               else
                []
        )
        [ text k ]


setTimerUnit : String -> Msg
setTimerUnit text =
    case Dict.get text timerUnits of
        Just unit ->
            SetTimerUnit unit

        Nothing ->
            SetTimerUnit Time.second


printModel : Model -> List (Html Msg)
printModel m =
    map (printSection m.linkStates) m.pageStructure


printSection : LinkStates -> Section -> Html Msg
printSection linkStates m_section =
    section [] <|
        h2 [ class "nom-domaine" ] [ text m_section.name ]
            :: map (printSubsection linkStates) m_section.subsections


printSubsection : LinkStates -> Subsection -> Html Msg
printSubsection linkStates m_subsection =
    div []
        [ h3 [] [ text m_subsection.name ]
        , dl [] <| concatMap (printLink linkStates) m_subsection.links
        ]


printLink : LinkStates -> Link -> List (Html Msg)
printLink linkStates link =
    [ dt [] [ a [ href link.url ] [ text link.title ] ]
    , dd [] [ text link.description, printState <| Dict.get link.url linkStates ]
    ]


printState : Maybe LinkState -> Html Msg
printState state =
    let
        stateText =
            case state of
                Just Unknown ->
                    "unkown"

                Just (Unreachable error) ->
                    "unreachable:" ++ toString error

                Just Reachable ->
                    "reachable"

                Nothing ->
                    "url not in dictionary !"
    in
        span [] [ br [] [], text "(", text stateText, text ")" ]
