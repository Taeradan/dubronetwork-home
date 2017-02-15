module Model exposing (..)


type alias Model =
    List Section


type alias Section =
    { name : String, subsections : List Subsection }


type alias Subsection =
    { name : String, links : List Link }


type alias Link =
    { url : String, title : String, description : String, state : LinkState }


type LinkState
    = Unknown
    | Unreachable { return : String }
    | Reachable { return : String, latency : Float }
