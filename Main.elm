module Main exposing (main)

import Html exposing (Html, text, div, span)
import Html.Attributes as Attrs
import Html.Events as Events
import Json.Decode as Decode
import Browser



connectBox one two = [
        div [Attrs.id one, Attrs.class "left"] [text one],
        span [
            Attrs.class "left-c", Attrs.draggable "true"
            ] [text "○"],
        span [Attrs.class ""] [text "X"],
        span [
            Attrs.class "right-c",
            Events.custom "dragover" <| (Decode.value |> Decode.map (\msg -> { message = Dragover , stopPropagation = False, preventDefault = True })),
            Events.custom "drop" <| (Decode.value |> Decode.map (\msg -> { message = Drop, stopPropagation = True, preventDefault = True }))
            ] [text "○"],
        div [Attrs.id two, Attrs.class "right"] [text two],
        Html.p [] []
    ]

view m = div [] (List.concat [
        connectBox "d-1" "d-2",
        connectBox "d-3" "d-4",
        connectBox "d-5" "d-6",
        connectBox "d-7" "d-8",
        connectBox "d-9" "d-10"
    ])
type Msg = Drop | Dragover

update msg model = 
    let
        _ = Debug.log "update" msg
    in  
        ( model, Cmd.none )            

main = Browser.element {
    subscriptions = always Sub.none,
    update = update,
    init = \() -> ((), Cmd.none),
    view = view
    }