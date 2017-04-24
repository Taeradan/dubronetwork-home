module Init exposing (..)

import Dict
import Model exposing (Configuration, LinkState(Unknown), LinkStates, Model, Section, getLinksFromStructure)
import Time exposing (second)
import Update exposing (Msg)


init : ( Model, Cmd Msg )
init =
    ( { pageStructure = initialPageStructure, linkStates = generateInitialLinkStates initialPageStructure, configuration = initialConfiguration }, Cmd.none )


generateInitialLinkStates : List Section -> LinkStates
generateInitialLinkStates pageStructure =
    Dict.fromList << List.map (\x -> ( x.url, Unknown )) << getLinksFromStructure <| pageStructure


initialPageStructure : List Section
initialPageStructure =
    [ { name = "dubronetwork.{fr,42}"
      , subsections =
            [ { name = "Perso"
              , links =
                    [ { url = "http://www.dubronetwork.fr/~taeradan", title = "Taeradan's blog", description = "Le blog du maîîîîîtrrrre !" }
                    , { url = "http://wed.dubronetwork.fr/", title = "Mariage", description = "Quelques photos" }
                    ]
              }
            , { name = "Utilitaires"
              , links =
                    [ { url = "http://agendav.dubronetwork.fr", title = "Agendav", description = "Pour consulter son agenda" }
                    , { url = "http://feeds.dubronetwork.fr", title = "TT-RSS", description = "Pour suivre ses flux préférés" }
                    , { url = "http://jyraphe.dubronetwork.fr", title = "Jyraphe", description = "Service de partage de fichiers" }
                    , { url = "http://webmail.dubronetwork.fr", title = "Webmail", description = "Pour lire ses mails hébergés @dubronetwork.fr" }
                    , { url = "http://indefero.dubronetwork.fr/indefero", title = "Indefero", description = "Gestion de projets pour GIT" }
                    , { url = "http://papillon.dubronetwork.fr", title = "Papillon", description = "Service de sondages" }
                    ]
              }
            , { name = "Miroirs"
              , links =
                    [ { url = "http://wikileaks.dubronetwork.fr", title = "Wikileaks (accueil+cablegate)", description = "Un des nombreux miroirs officiels de WIkileaks (plus de 1600 miroirs)" }
                    , { url = "http://wardiary.dubronetwork.fr", title = "Wikileaks (wardiary)", description = "Les documents de Wikileaks sur la guerre en Afghanistan" }
                    , { url = "http://saaty.dubronetwork.fr", title = "Saaty", description = "Le site du père d'AHP" }
                    ]
              }
            ]
      }
    , { name = "teleragno.{fr,42}"
      , subsections =
            [ { name = ""
              , links =
                    [ { url = "http://www.teleragno.fr", title = "Teleragno", description = "Le site du FAI associatif Teleragno" }
                    , { url = "http://lists.teleragno.fr", title = "Mailman", description = "Interface de gestion des listes de diffusion" }
                    ]
              }
            ]
      }
    , { name = "global-anycast.net"
      , subsections =
            [ { name = ""
              , links =
                    [ { url = "http://www.global-anycast.net", title = "Global Anycast", description = "Le site du projet de réseau anycast mondial" }
                    , { url = "http://mail.global-anycast.net", title = "Mailman", description = "Interface de gestion des listes de diffusion" }
                    ]
              }
            ]
      }
    ]


initialConfiguration : Configuration
initialConfiguration =
    { timerUnit = second, timerValue = 60 }
