module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)
import Array exposing (Array, get, set)
import String exposing (fromInt)

-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model = Array (Int, Int)

init : Model
init =
    Array.fromList [(13, 1), (12, 2), (10, 3), (4, 4), (6, 5), (8, 6), (1, 7), (3, 8), (2, 9), (0, 10), (5, 11), (7, 12), (9, 13), (11, 14), (14, 15), (15, 0), (9, 9)  ] 
final : Model
final =
    Array.fromList [(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10), (11, 11), (12, 12), (13, 13), (14, 14), (15, 15), (0, 0), (15, 15)  ] 

-- Swap function : Swaops any 2 given buttons
swap : Int -> Model -> Model
swap clickedPos model =
  let
    -- blankedPos is the current index of the blank value
    blankPos : Int
    blankPos = (model |> get 16 |> Maybe.withDefault (0,0) |> Tuple.first)
    -- clicked = ("Blank" value, value supposed to be in clicked tuple)
    clicked : (Int, Int)
    clicked = 
      ( model |> get blankPos |> Maybe.withDefault (0,0) |> Tuple.first {- Gets the "blank" value -}
      , model |> get clickedPos |> Maybe.withDefault (0,0) |> Tuple.second {- Gets the value that is supposed to be in this tuple -} 
      )
    -- blank = (Clicked value, value supposed to be in clicked tuple)
    blank : (Int, Int)
    blank = 
      ( model |> get clickedPos |> Maybe.withDefault (0,0) |> Tuple.first {- Gets the clicked value -}
      , model |> get blankPos |> Maybe.withDefault (0,0) |> Tuple.second {- Gets the value that is supposed to be in this tuple -}
      )
    -- NewModel = old model but with the clicked value and the blank value swapped. It also updates the coordinates of the blank value in the last element of the array
    newModel : Model
    newModel = 
      model |> set blankPos blank |> set clickedPos clicked |> set 16 (clickedPos, clickedPos)
  in
    newModel

-- Validation : validates that the given buttons are adjacent, and returns an updated model if they are
validation : Int -> Model -> Model
validation clickedPos model =
    let 
        blankPos : Int
        blankPos = (model |> get 16 |> Maybe.withDefault (0,0) |> Tuple.first)
    in
        if (blankPos == clickedPos + 1 || blankPos == clickedPos - 1 || blankPos == clickedPos + 4 || blankPos == clickedPos - 4) 
            then swap clickedPos model
            else model

type Msg
  = Swap01 | Swap02 | Swap03 | Swap04 | Swap05 | Swap06 | Swap07 | Swap08 | Swap09 | Swap10 | Swap11 | Swap12 | Swap13 | Swap14 | Swap15 | Swap16

-- UPDATE
update : Msg -> Model -> Model
update msg model =
  case msg of
    Swap01 ->
        validation 0 model
    Swap02 ->
        validation 1 model
    Swap03 -> 
        validation 2 model
    Swap04 ->
        validation 3 model
    Swap05 ->
        validation 4 model
    Swap06 -> 
        validation 5 model
    Swap07 ->
        validation 6 model
    Swap08 ->
        validation 7 model
    Swap09 -> 
        validation 8 model
    Swap10 ->
        validation 9 model
    Swap11 ->
        validation 10 model
    Swap12 -> 
        validation 11 model
    Swap13 ->
        validation 12 model
    Swap14 ->
        validation 13 model
    Swap15 -> 
        validation 14 model
    Swap16 ->
        validation 15 model

-- VIEW


view model =
  div []
    [ button [ style "width" "50px", style "height" "50px", onClick Swap01 ] [ text (fromInt (model |> get 0 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , button [ style "width" "50px", style "height" "50px", onClick Swap02 ] [ text (fromInt (model |> get 1 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , button [ style "width" "50px", style "height" "50px", onClick Swap03 ] [ text (fromInt (model |> get 2 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , button [ style "width" "50px", style "height" "50px", onClick Swap04 ] [ text (fromInt (model |> get 3 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , div [] []
    , button [ style "width" "50px", style "height" "50px", onClick Swap05 ] [ text (fromInt (model |> get 4 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , button [ style "width" "50px", style "height" "50px", onClick Swap06 ] [ text (fromInt (model |> get 5 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , button [ style "width" "50px", style "height" "50px", onClick Swap07 ] [ text (fromInt (model |> get 6 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , button [ style "width" "50px", style "height" "50px", onClick Swap08 ] [ text (fromInt (model |> get 7 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , div [] []
    , button [ style "width" "50px", style "height" "50px", onClick Swap09 ] [ text (fromInt (model |> get 8 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , button [ style "width" "50px", style "height" "50px", onClick Swap10 ] [ text (fromInt (model |> get 9 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , button [ style "width" "50px", style "height" "50px", onClick Swap11 ] [ text (fromInt (model |> get 10 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , button [ style "width" "50px", style "height" "50px", onClick Swap12 ] [ text (fromInt (model |> get 11 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , div [] []
    , button [ style "width" "50px", style "height" "50px", onClick Swap13 ] [ text (fromInt (model |> get 12 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , button [ style "width" "50px", style "height" "50px", onClick Swap14 ] [ text (fromInt (model |> get 13 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , button [ style "width" "50px", style "height" "50px", onClick Swap15 ] [ text (fromInt (model |> get 14 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , button [ style "width" "50px", style "height" "50px", onClick Swap16 ] [ text (fromInt (model |> get 15 |> Maybe.withDefault (0,0) |> Tuple.first)) ]
    , div [] [ if model == final    
                then text "Game Over" 
                else text ""
                ]
    ]