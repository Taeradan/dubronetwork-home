module Model exposing (..)

import Dict exposing (Dict)
import Http


type alias Model =
    { pageStructure : List Section, linkStates : LinkStates }


type alias Section =
    { name : String, subsections : List Subsection }


type alias Subsection =
    { name : String, links : List Link }


type alias LinkUrl =
    String


type alias Link =
    { url : LinkUrl, title : String, description : String }


type alias LinkStates =
    Dict String LinkState


type LinkState
    = Unknown
    | Unreachable { error : Http.Error }
    | Reachable
