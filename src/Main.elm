module Main exposing (..)

import Html exposing (Html)
import Model exposing (LinkState(Unknown), Model)
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


dubronetworkInit : Model
dubronetworkInit =
    [ { name = "dubronetwork.{fr,42}"
      , subsections =
            [ { name = "Perso"
              , links =
                    [ { url = "http://www.dubronetwork.fr/~taeradan", title = "Taeradan's blog", description = "Le blog du maîîîîîtrrrre !", state = Unknown }
                    , { url = "http://wed.dubronetwork.fr/", title = "Mariage", description = "Quelques photos", state = Unknown }
                    ]
              }
            , { name = "Utilitaires"
              , links =
                    [ { url = "http://agendav.dubronetwork.fr", title = "Agendav", description = "Pour consulter son agenda", state = Unknown }
                    , { url = "http://feeds.dubronetwork.fr", title = "TT-RSS", description = "Pour suivre ses flux préférés", state = Unknown }
                    , { url = "http://jyraphe.dubronetwork.fr", title = "Jyraphe", description = "Service de partage de fichiers", state = Unknown }
                    , { url = "http://webmail.dubronetwork.fr", title = "Webmail", description = "Pour lire ses mails hébergés @dubronetwork.fr", state = Unknown }
                    , { url = "http://indefero.dubronetwork.fr/indefero", title = "Indefero", description = "Gestion de projets pour GIT", state = Unknown }
                    , { url = "http://papillon.dubronetwork.fr", title = "Papillon", description = "Service de sondages", state = Unknown }
                    ]
              }
            , { name = "Miroirs"
              , links =
                    [ { url = "http://wikileaks.dubronetwork.fr", title = "Wikileaks (accueil+cablegate)", description = "Un des nombreux miroirs officiels de WIkileaks (plus de 1600 miroirs)", state = Unknown }
                    , { url = "http://wardiary.dubronetwork.fr", title = "Wikileaks (wardiary)", description = "Les documents de Wikileaks sur la guerre en Afghanistan", state = Unknown }
                    , { url = "http://saaty.dubronetwork.fr", title = "Saaty", description = "Le site du père d'AHP", state = Unknown }
                    ]
              }
            ]
      }
    , { name = "teleragno.{fr,42}"
      , subsections =
            [ { name = ""
              , links =
                    [ { url = "http://www.teleragno.fr", title = "Teleragno", description = "Le site du FAI associatif Teleragno", state = Unknown }
                    , { url = "http://lists.teleragno.fr", title = "Mailman", description = "Interface de gestion des listes de diffusion", state = Unknown }
                    ]
              }
            ]
      }
    , { name = "global-anycast.net"
      , subsections =
            [ { name = ""
              , links =
                    [ { url = "http://www.global-anycast.net", title = "Global Anycast", description = "Le site du projet de réseau anycast mondial", state = Unknown }
                    , { url = "http://mail.global-anycast.net", title = "Mailman", description = "Interface de gestion des listes de diffusion", state = Unknown }
                    ]
              }
            ]
      }
    ]
