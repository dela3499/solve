module Util exposing (..)

import Html exposing (Html, text, div, span, a, img, p, i, input, table, tr, td)
import Html.App as Html
import Html.Events exposing (onClick, onInput, onBlur, onFocus)
import Html.Attributes exposing (..)
import Unicode exposing (text')
import Types exposing (..)
import String
import Set
  
upArrow = 
  text' "&#8593;"


downArrow = 
  text' "&#8595;"


wrap: String -> Html Msg -> Html Msg
wrap class' html = 
  div
    [ class (String.join " " ["wrapper", class']) ]
    [ html ]


px n = 
  toString n ++ "px"     


toggleMember value set = 
  if Set.member value set then
    Set.remove value set
  else
    Set.insert value set


getAllListIds lists =
  lists
    |> List.map .id 
    |> Set.fromList    