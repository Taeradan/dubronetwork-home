module View exposing (..)

import Html exposing (Html, a, body, br, dd, div, dl, dt, form, h1, h2, h3, header, input, node, p, section, span, text)
import Html.Attributes exposing (action, attribute, class, content, href, id, lang, media, method, name, rel, title, type_, value)
import List exposing (concat, concatMap, map)
import Model exposing (..)
import Update exposing (Msg)


view : Model -> Html Msg
view model =
    node "html"
        [ lang "fr" ]
        [ pageHead
        , pageBody model
        ]


pageBody : Model -> Html Msg
pageBody m =
    body [] (bodyHeader :: (printModel m))


printModel : Model -> List (Html Msg)
printModel m =
    map (printSection m.linkStates) m.pageStructure


printSection : LinkStates -> Section -> Html Msg
printSection linkStates m_section =
    section []
        ((h2 [ class "nom-domaine" ] [ text m_section.name ])
            :: (map (printSubsection linkStates) m_section.subsections)
        )


printSubsection : LinkStates -> Subsection -> Html Msg
printSubsection linkStates m_subsection =
    div []
        [ h3 [] [ text m_subsection.name ]
        , dl [] (concatMap (printLink linkStates) m_subsection.links)
        ]


printLink : LinkStates -> Link -> List (Html Msg)
printLink linkStates link =
    [ dt [] [ a [ href link.url ] [ text link.title ] ]
    , dd [] [ text link.description ]
    ]


printState : LinkState -> Html Msg
printState state =
    let
        stateText =
            case state of
                Unknown ->
                    "unkown"

                Unreachable error ->
                    "unreachable:" ++ toString error

                Reachable ->
                    "reachable"
    in
        span [] [ br [] [], text "(", text stateText, text ")" ]


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


bodyHeader : Html Msg
bodyHeader =
    header []
        [ h1 [] [ text "Portail Dubronetwork" ]
        , form [ action "http://duckduckgo.com", id "recherche", method "get" ]
            [ p []
                [ input [ id "champ-recherche", attribute "maxlength" "255", name "q", attribute "size" "31", type_ "text", value "" ]
                    []
                , text "            "
                , input [ type_ "submit", value "DuckDuckGo!" ] []
                ]
            ]
        ]
