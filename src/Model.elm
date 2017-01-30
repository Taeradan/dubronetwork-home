module Model exposing (..)


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
    [ { name = "section toto :)"
      , subsections =
            [ { name = "subsection riri"
              , links =
                    [ { url = "http://package.elm-lang.org/packages/elm-lang/core/latest", title = "Elm Core Libraries", description = "Every Elm project needs the core libraries. " }
                    , { url = "https://github.com/Taeradan/dubronetwork-home", title = "dubronetwork-home", description = "New home page for my personal domain dubronetwork" }
                    ]
              }
            , { name = "subsection loulou"
              , links =
                    [ { url = "http://package.elm-lang.org/packages/elm-lang/core/latest", title = "Elm Core Libraries", description = "Every Elm project needs the core libraries. " }
                    , { url = "https://github.com/Taeradan/dubronetwork-home", title = "sdcdd-home", description = "New home page for my personal domain dubronetwork" }
                    , { url = "https://github.com/Taeradan/dubronetwork-home", title = "dubronetwork-home", description = "New home page for my personal domain dubronetwork" }
                    , { url = "https://github.com/Taeradan/dubronetwork-home", title = "dubronetwork-home", description = "New home page for my personal domain dubronetwork" }
                    , { url = "https://github.com/Taeradan/dubronetwork-home", title = "gdx-home", description = "New home page for my personal domain dubronetwork" }
                    ]
              }
            ]
      }
    , { name = "section tata :)"
      , subsections =
            [ { name = "subsection rigfgggri", links = [] }
            , { name = "subsection loulou", links = [] }
            ]
      }
    ]
