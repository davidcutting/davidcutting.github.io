module Counter exposing (main)

import Html exposing (..)
import Html.Events exposing (..)
import Browser

type alias Model =
    Int

initialModel : Model
initialModel =
    0

view : Model -> Html Msg
view model =
    div []
        [
            button [onClick Decrement] [ text "-" ],
            text (String.fromInt model),
            button [onClick Increment] [ text "+" ]
        ]

main : Program () Model Msg
main =
    Browser.sandbox
    {
        init = initialModel,
        view = view,
        update = update
    }

type Msg =
    Increment |
    Decrement

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1
        Decrement ->
            model - 1