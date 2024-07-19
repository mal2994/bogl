module Boggle exposing (..)

import Array exposing (Array)
import Browser
import Html exposing (Html, a, div, text)
import Html.Attributes exposing (class)
import Random


main : Program () Model Msg
main =
    Browser.element { init = init, update = update, view = view, subscriptions = \_ -> Sub.none }


init : a -> ( Model, Cmd Msg )
init _ =
    ( initialModel, initialCmd )


type alias Model =
    { faces : List Char }


type Msg
    = GotNewDiceRoll Int


initialModel : Model
initialModel =
    { faces = [] }


defaultFaces : List (List Char)
defaultFaces =
    [ [ 'R', 'I', 'F', 'O', 'B', 'X' ]
    , [ 'I', 'F', 'E', 'H', 'E', 'Y' ]
    , [ 'D', 'E', 'N', 'O', 'W', 'S' ]
    , [ 'U', 'T', 'O', 'K', 'N', 'D' ]
    , [ 'H', 'M', 'S', 'R', 'A', 'O' ]
    , [ 'L', 'U', 'P', 'E', 'T', 'S' ]
    , [ 'A', 'C', 'I', 'T', 'O', 'A' ]
    , [ 'Y', 'L', 'G', 'K', 'U', 'E' ]
    , [ 'U', 'B', 'M', 'J', 'O', 'A' ]
    , [ 'E', 'H', 'I', 'S', 'P', 'N' ]
    , [ 'V', 'E', 'T', 'I', 'N', 'G' ]
    , [ 'B', 'A', 'L', 'I', 'Y', 'T' ]
    , [ 'E', 'Z', 'A', 'V', 'N', 'D' ]
    , [ 'R', 'A', 'L', 'E', 'S', 'C' ]
    , [ 'U', 'W', 'I', 'L', 'R', 'G' ]
    , [ 'P', 'A', 'C', 'E', 'M', 'D' ]
    ]


randomDiceRollsCmd : List (Cmd Msg)
randomDiceRollsCmd =
    List.range 1 16
        |> List.map
            (\_ -> Random.generate GotNewDiceRoll (Random.int 1 6))


initialCmd : Cmd Msg
initialCmd =
    Cmd.batch randomDiceRollsCmd


view : Model -> Html Msg
view model =
    div [ class "grid" ] (List.map (\a -> viewCell a) model.faces)


viewCell : Char -> Html Msg
viewCell letter =
    div [ class "cell" ] [ letter |> Char.toUpper |> String.fromChar |> Html.text ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotNewDiceRoll face ->
            let
                newFace : Char
                newFace =
                    listGetAt
                        (listGetAt defaultFaces (List.length model.faces)
                            |> Maybe.withDefault [ 'A' ]
                        )
                        face
                        |> Maybe.withDefault 'A'
            in
            ( { model | faces = List.append model.faces [ newFace ] }
            , Cmd.none
            )


listGetAt : List a -> Int -> Maybe a
listGetAt list index =
    List.drop (index - 1) list |> List.head
