module Types exposing (..)

import Set exposing (Set)
import Dict exposing (Dict)
import Dom
import Random.Pcg

type alias Model = 
  { lists: List List'
  , ideas: List Idea
  , selectedLists1: Set String
  , selectedLists2: Set String
  , page: Page
  , editListName: Maybe String
  , editListItems: Maybe (List String)
  , editListItem: Maybe String
  , seed: Random.Pcg.Seed
  , t: Float
  , search: Bool
  , sort: Direction
  , randomItem1: String
  , randomItem2: String
  , editIdeaTitle: String
  , editIdeaText: String
  }


type alias List' = 
  { title: String
  , items: List String
  , created: Float -- ms timestamp
  , id: String
  }


type alias Idea = 
  { title: String
  , text: String
  , created: Float -- ms timestamp
  , id: String
  }


type Msg 
  = NoMsg
  | SetPage Page
  | SetSearch Bool
  | ToggleList String -- Maybe turn this into UUID
  | SelectAllLists
  | ClearAllLists
  | ToggleSort
  | DrawRandomItems
  | SetIdeaTitle String
  | SetIdeaText String
  | SaveIdea
  | SetTime Float


type Page
  = Ideas
  | Statistics
  | Settings
  | NewIdea
  | SelectLists1
  | SelectLists2


type Direction 
  = Ascending 
  | Descending


  --| SetPage Page
  --| SetList ListId
  --| SetInitialSeed Int
   
  --| EditListName String
  --| EditItem
  --| RemoveItem Int
  --| SetItem String
  --| Save
  --| RecordFocus Focus
  --| SetFocus Focus
  --| KeyUp Int
  --| NoMsg
  --| ErrorMsg Dom.Error
  --| SuccessMsg ()
  --| ClearField Focus
  --| SetInitialSeed Int
  --| Edit List'
  --| SetInputValue Focus String
  --| SetTime Float
  --| Delete





--type Focus 
--  = NoFocus
--  | ListName 
--  | ListItem