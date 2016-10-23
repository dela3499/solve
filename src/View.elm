module View exposing (..)

import Html exposing (Html, text, div, span, a, img, p, i, input, table, tr, td)
import Html.App as Html
import Html.Events exposing (onClick, onInput, onBlur, onFocus)
import Html.Attributes exposing (..)
import Maybe exposing (withDefault)
import Set exposing (Set)
import Dict exposing (Dict)
import String
import Types exposing (..)
import Util


app: Model -> Html Msg
app model =
  div 
    [ id "app" ] 
    [ ideasHeader model.page
    , content (ideas model)
    , footerMenu model.page 
    ] 


content contents = 
  div
    [ class "content" ]
    [ contents ]


ideas model = 
  div 
    [ class "ideas" ]
    (List.map idea model.ideas)


idea: Idea -> Html Msg
idea idea' = 
  div
    [ class "idea" ]
    [ div
        [ class "title bold" ]
        [ text idea'.title ]
    , div 
        [ class "text" ]
        [ text (truncate 100 idea'.content) ]
    ]


truncate limit string  = 
  let n = String.length string
  in 
    if n > limit then
      (String.left limit string) ++ "..."
    else
      string


ideasHeader page = 
  let wrap html = 
        div
          [ class "wrapper" ]
          [ html ]
  in 
    div 
      [ class "ideas header material" ]
      (List.map wrap
        [ i 
            [ class "fa fa-search" ]
            []
        , span [ class "medium" ] [ text "Sort by" ]
        , span [ class "bold medium" ] [ text "score" ]
        , span [ class "arrow medium" ] [ Util.upArrow ]
        , i 
            [ class "fa fa-pencil-square-o" ]
            []       
        , i 
            [ class "fa fa-trash-o" ]
            []    
        ]
      )


footerMenu page = 
  let buttons = 
        [ ("Ideas", "fa-lightbulb-o")
        , ("Stats", "fa-pie-chart")
        , ("Settings", "fa-cog")
        ]
      createButton (label, icon) = 
        div
          [ class "button" ]
          [ i
              [ class ("fa " ++ icon) ]
              []
          , div
              [ class "label" ]
              [ text label ]
          ]
  in 
    div 
      [ class "footer material" ]
      (List.map createButton buttons)