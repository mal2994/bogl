module Poc exposing (..)

import Browser
import Html exposing (Html)
import Random


type alias Model =
    { diceFaces : List Int }


type Msg
    = NewDiceRoll Int


initialModel : Model
initialModel =
    { diceFaces = [] }


faces : List Int
faces =
    List.range 1 6


randomDiceRollsCmd : List (Cmd Msg)
randomDiceRollsCmd =
    List.range 1 16
        |> List.map (\_ -> Random.generate NewDiceRoll (Random.int 1 6))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewDiceRoll face ->
            ( { model | diceFaces = List.append model.diceFaces [ face ] }, Cmd.none )


init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.batch randomDiceRollsCmd )


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Html.text
            (List.foldr (String.fromInt >> (++)) "" model.diceFaces)
        ]


main : Program () Model Msg
main =
    Browser.element { init = init, update = update, view = view, subscriptions = \_ -> Sub.none }
