module View exposing (..)

import Html exposing (Html, text, div, span, a, img, p, i, input)
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
    [] 
    [ headerMenu model.page
    , footerMenu model.page 
    ] 


headerMenu model = 
  div 
    []
    [ i 
        [ class "fa fa-search" ]
        []
    , div
        []
        [ span [] [ text "Sort by" ]
        , span [] [ text "score" ]
        , span [] [ Util.upArrow ]
        , i 
            [ class "fa fa-trash-o" ]
            []    
        , i 
            [ class "fa fa-pencil-square-o" ]
            []    
        ]
    ]


footerMenu page = 
  div 
    []
    [ i 
        [ class "fa fa-lightbulb-o" ]
        []
    , i 
        [ class "fa fa-pie-chart" ]
        []
    , i 
        [ class "fa fa-cog" ]
        []
    ]