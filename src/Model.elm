module Model exposing (..)

import Http


type alias Model =
    { pageStructure : List Section }


type alias Section =
    { name : String, subsections : List Subsection }


type alias Subsection =
    { name : String, links : List Link }


type alias LinkUrl =
    String


type alias Link =
    { url : LinkUrl, title : String, description : String }


type LinksStates
    = Dict String LinkState


type LinkState
    = Unknown
    | Unreachable { error : Http.Error }
    | Reachable
