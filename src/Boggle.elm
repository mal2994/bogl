module Boggle exposing (..)

import Array exposing (Array)
import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)


main : Program () Model Msg
main =
    Browser.element { init = init, update = update, view = view, subscriptions = \_ -> Sub.none }


init : a -> ( Model, Cmd Msg )
init _ =
    ( initialModel, initialCmd )


type alias Model =
    { dice : List Char }


type Msg
    = GotRandomFace


initialModel : Model
initialModel =
    -- { dice = [ 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a' ] }
    let
        faces =
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
    in
    { dice = [] }


initialCmd : Cmd msg
initialCmd =
    Cmd.none


view : Model -> Html Msg
view model =
    div [ class "grid" ] (List.map (\a -> viewCell a) model.dice)


viewCell : Char -> Html Msg
viewCell letter =
    div [ class "cell" ] [ letter |> Char.toUpper |> String.fromChar |> Html.text ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotRandomFace ->
            ( model, Cmd.none )
