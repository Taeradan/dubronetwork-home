module Main exposing (..)

import Html exposing (Html, a, body, dd, div, dl, dt, form, h1, h2, h3, header, input, node, p, section, text)
import Html.Attributes exposing (action, attribute, class, content, href, id, lang, media, method, name, rel, title, type_, value)
import List exposing (concatMap, head, map)
import String exposing (cons)


main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- Model


type alias Model =
    List Section


type alias Section =
    { name : String, subsections : List Subsection }


type alias Subsection =
    { name : String, links : List Link }


type alias Link =
    { url : String, title : String, description : String }


model : Model
model =
    []



-- Update


type Msg
    = None


update : Msg -> Model -> Model
update msg model =
    model



-- View


view : Model -> Html Msg
view model =
    node "html"
        [ lang "fr" ]
        [ pageHead
        , bodyGenerator model
        , pageBody
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
            [ href "default.css", media "screen", rel "stylesheet", title "Style par défaut", type_ "text/css" ]
            []
        , node "script"
            [ type_ "text/javascript" ]
            [ text "        " ]
        ]


bodyGenerator : Model -> Html Msg
bodyGenerator m =
    body []
        (pageHeader :: (printModel m))


printModel : Model -> List (Html Msg)
printModel sections =
    map printSection sections


printSection : Section -> Html Msg
printSection m_section =
    section []
        ((h2 [ class "nom-domaine" ] [ text m_section.name ])
            :: (map printSubsection m_section.subsections)
        )


printSubsection : Subsection -> Html Msg
printSubsection m_subsection =
    div []
        [ h3 []
            [ text m_subsection.name ]
        , dl []
            (concatMap printLink m_subsection.links)
        ]


printLink : Link -> List (Html Msg)
printLink link =
    [ dt [] [ text link.description ]
    , dd []
        [ a [ href link.url ] [ text link.title ]
        ]
    ]


pageHeader : Html Msg
pageHeader =
    header []
        [ h1 []
            [ text "Portail Dubronetwork" ]
        , form [ action "http://duckduckgo.com", id "recherche", method "get" ]
            [ p []
                [ input [ id "champ-recherche", attribute "maxlength" "255", name "q", attribute "size" "31", type_ "text", value "" ]
                    []
                , text "            "
                , input [ type_ "submit", value "DuckDuckGo!" ]
                    []
                ]
            ]
        ]


pageBody : Html Msg
pageBody =
    body []
        [ header []
            [ h1 []
                [ text "Portail Dubronetwork" ]
            , form [ action "http://duckduckgo.com", id "recherche", method "get" ]
                [ p []
                    [ input [ id "champ-recherche", attribute "maxlength" "255", name "q", attribute "size" "31", type_ "text", value "" ]
                        []
                    , text "            "
                    , input [ type_ "submit", value "DuckDuckGo!" ]
                        []
                    ]
                ]
            ]
        , section [ id "dubronetwork" ]
            [ h2 [ class "nom-domaine" ]
                [ text "dubronetwork.{fr,42}" ]
            , h3 []
                [ text "Perso" ]
            , dl []
                [ dt []
                    [ a [ href "http://www.dubronetwork.fr/~taeradan" ]
                        [ text "Taeradan's blog" ]
                    ]
                , dd []
                    [ text "Le blog du maîîîîîtrrrre !" ]
                , dt []
                    [ a [ href "http://wed.dubronetwork.fr/" ]
                        [ text "Mariage" ]
                    ]
                , dd []
                    [ text "Quelques photos" ]
                ]
            , h3 []
                [ text "Utilitaires" ]
            , dl []
                [ dt []
                    [ a [ href "http://agendav.dubronetwork.fr" ]
                        [ text "Agendav" ]
                    ]
                , dd []
                    [ text "Pour consulter son agenda" ]
                , dt []
                    [ a [ href "http://indefero.dubronetwork.fr/indefero" ]
                        [ text "Indefero" ]
                    ]
                , dd []
                    [ text "Gestion de projets pour GIT" ]
                , dt []
                    [ a [ href "http://jyraphe.dubronetwork.fr" ]
                        [ text "Jyraphe" ]
                    ]
                , dd []
                    [ text "Service de partage de fichiers" ]
                , dt []
                    [ a [ href "http://papillon.dubronetwork.fr" ]
                        [ text "Papillon" ]
                    ]
                , dd []
                    [ text "Service de sondages" ]
                , dt []
                    [ a [ href "http://feeds.dubronetwork.fr" ]
                        [ text "TT-RSS" ]
                    ]
                , dd []
                    [ text "Pour suivre ses flux préférés" ]
                , dt []
                    [ a [ href "http://webmail.dubronetwork.fr" ]
                        [ text "Webmail" ]
                    ]
                , dd []
                    [ text "Pour lire ses mails hébergés @dubronetwork.fr" ]
                ]
            , h3 []
                [ text "Miroirs" ]
            , dl []
                [ dt []
                    [ a [ href "http://wikileaks.dubronetwork.fr" ]
                        [ text "Wikileaks (accueil+cablegate)" ]
                    ]
                , dd []
                    [ text "Un des nombreux miroirs officiels de WIkileaks (plus de 1600 miroirs)" ]
                , dt []
                    [ a [ href "http://wardiary.dubronetwork.fr" ]
                        [ text "Wikileaks (wardiary)" ]
                    ]
                , dd []
                    [ text "Les documents de Wikileaks sur la guerre en Afghanistan" ]
                , dt []
                    [ a [ href "http://saaty.dubronetwork.fr" ]
                        [ text "Saaty" ]
                    ]
                , dd []
                    [ text "Le site du père d'AHP" ]
                ]
            ]
        , section [ class "domaine", id "teleragno" ]
            [ h2 [ class "nom-domaine" ]
                [ text "teleragno.{fr,42}" ]
            , dl []
                [ dt []
                    [ a [ href "http://www.teleragno.fr" ]
                        [ text "Teleragno" ]
                    ]
                , dd []
                    [ text "Le site du FAI associatif Teleragno" ]
                , dt []
                    [ a [ href "http://lists.teleragno.fr" ]
                        [ text "Mailman" ]
                    ]
                , dd []
                    [ text "Interface de gestion des listes de diffusion" ]
                ]
            ]
        , section [ class "domaine", id "global-anycast.net" ]
            [ h2 [ class "nom-domaine" ]
                [ text "global-anycast.net" ]
            , dl []
                [ dt []
                    [ a [ href "http://www.global-anycast.net" ]
                        [ text "Global Anycast" ]
                    ]
                , dd []
                    [ text "Le site du projet de réseau anycast mondial" ]
                , dt []
                    [ a [ href "http://mail.global-anycast.net" ]
                        [ text "Mailman" ]
                    ]
                , dd []
                    [ text "Interface de gestion des listes de diffusion" ]
                ]
            ]
        ]
