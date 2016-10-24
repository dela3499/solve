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
import Cmd.Extra
import Types exposing (..)
import Util
import View
import Update
--import Ports


main = 
  Html.program
    { init = ( initModel, initCmd)
    , update = Update.app
    , view = View.app
    , subscriptions = subscriptions
    }


initCmd = 
  Cmd.Extra.message DrawRandomItems


subscriptions: Model -> Sub Msg
subscriptions model = 
  Time.every Time.second SetTime
  --Ports.randomSeed (\int -> SetInitialSeed int)


initModel: Model
initModel = 
  { page = NewIdea
  , search = False
  , sort = Ascending
  , ideas = initIdeas
  , lists = initLists
  , selectedLists1 = allListIds
  , selectedLists2 = allListIds
  , editListName = Nothing
  , editListItems = Nothing
  , editListItem = Nothing
  , t = 0.0
  , seed = 
      Random.Pcg.initialSeed 123894123097 --replaced on start
  , randomItem1 = "-"
  , randomItem2 = "-"
  , editIdeaTitle = ""
  , editIdeaText = ""
  }


allListIds = 
  Util.getAllListIds initLists

initLists = 
  [ { title = "Google Earth tours"
    , items = [ "Zimbabwe", "Santa Clara", "River systems", "Famous buildings" ]
    , created = 1477202325738
    , id = "L1"
    }
  , { title = "Google Earth tours"
    , items = [ "Zimbabwe", "Santa Clara", "River systems", "Famous buildings" ]
    , created = 1477202325738
    , id = "L2"
    }
  , { title = "Google Earth tours"
    , items = [ "Zimbabwe", "Santa Clara", "River systems", "Famous buildings" ]
    , created = 1477202325738
    , id = "L3"
    }
  , { title = "Google Earth tours"
    , items = [ "Zimbabwe", "Santa Clara", "River systems", "Famous buildings" ]
    , created = 1477202325738
    , id = "L4"
    }
  , { title = "Google Earth tours"
    , items = [ "Zimbabwe", "Santa Clara", "River systems", "Famous buildings" ]
    , created = 1477202325738
    , id = "L5"
    }
  ]        



type alias List' = 
  { title: String
  , items: List String
  , created: Float -- ms timestamp
  }


initIdeas = 
  [ { title = "Google Earth tours"
    , text = "It might be really fun to get a big screen, a nice internet connection, and treat people to a whirlwind tour with Google Earth."
    , created = 1477202325738
    , id = "Ia"
    }
  , { title = "Google Earth tours"
    , text = "It might be really fun to get a big screen, a nice internet connection, and treat people to a whirlwind tour with Google Earth."
    , created = 1477202325738
    , id = "Ib"
    }
  , { title = "Google Earth tours"
    , text = "It might be really fun to get a big screen, a nice internet connection, and treat people to a whirlwind tour with Google Earth."
    , created = 1477202325738
    , id = "Ic"
    } 
  , { title = "Google Earth tours"
    , text = "It might be really fun to get a big screen, a nice internet connection, and treat people to a whirlwind tour with Google Earth."
    , created = 1477202325738
    , id = "Ia"
    }
  , { title = "Google Earth tours"
    , text = "It might be really fun to get a big screen, a nice internet connection, and treat people to a whirlwind tour with Google Earth."
    , created = 1477202325738
    , id = "Ib"
    }
  , { title = "Google Earth tours"
    , text = "It might be really fun to get a big screen, a nice internet connection, and treat people to a whirlwind tour with Google Earth."
    , created = 1477202325738
    , id = "Ic"
    } 
  , { title = "Google Earth tours"
    , text = "It might be really fun to get a big screen, a nice internet connection, and treat people to a whirlwind tour with Google Earth."
    , created = 1477202325738
    , id = "Ia"
    }
  , { title = "Google Earth tours"
    , text = "It might be really fun to get a big screen, a nice internet connection, and treat people to a whirlwind tour with Google Earth."
    , created = 1477202325738
    , id = "Ib"
    }
  , { title = "Google Earth tours"
    , text = "It might be really fun to get a big screen, a nice internet connection, and treat people to a whirlwind tour with Google Earth."
    , created = 1477202325738
    , id = "Ic"
    } 
  ]


