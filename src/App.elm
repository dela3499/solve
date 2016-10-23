module App exposing (..)

import Html exposing (Html, text, div, span, a, img, p, i, input)
import Html.App as Html
import Html.Events exposing (onClick, onInput, onSubmit)
import Html.Attributes exposing (..)
import Maybe exposing (withDefault)
import Set exposing (Set)
import Dict exposing (Dict)
import String
import Keyboard
import Time
import Random.Pcg
import Time

import Types exposing (..)
--import Util
import View
import Update
--import Ports


main = 
  Html.program
    { init = ( initModel, Cmd.none )
    , update = Update.app
    , view = View.app
    , subscriptions = subscriptions
    }


subscriptions: Model -> Sub Msg
subscriptions model = 
  Sub.none
  --Ports.randomSeed (\int -> SetInitialSeed int)


initModel: Model
initModel = 
  { page = Ideas
  , ideas = initIdeas
  , lists = initLists
  , comboLists1 = All
  , comboLists2 = All
  , editListName = Nothing
  , editListItems = Nothing
  , editListItem = Nothing
  , t = 0.0
  , seed = 
      Random.Pcg.initialSeed 123894123097 --replaced on start
  }


initLists = 
  Dict.fromList
    []

initIdeas = 
  [ { title = "Google Earth tours"
    , content = "It might be really fun to get a big screen, a nice internet connection, and treat people to a whirlwind tour with Google Earth."
    , created = 1477202325738
    }
  , { title = "Google Earth tours"
    , content = "It might be really fun to get a big screen, a nice internet connection, and treat people to a whirlwind tour with Google Earth."
    , created = 1477202325738
    }
  , { title = "Google Earth tours"
    , content = "It might be really fun to get a big screen, a nice internet connection, and treat people to a whirlwind tour with Google Earth."
    , created = 1477202325738
    } 
  ]


