module Types exposing (..)

import Set exposing (Set)
import Dict exposing (Dict)
import Dom
import Random.Pcg

type alias Model = 
  { lists: Dict String List'
  , ideas: List Idea
  , comboLists1: ListSelection
  , comboLists2: ListSelection
  , page: Page
  , editListName: Maybe String
  , editListItems: Maybe (List String)
  , editListItem: Maybe String
  , seed: Random.Pcg.Seed
  , t: Float
  , search: Bool
  , sort: Direction
  }


type alias List' = 
  { title: String
  , items: List String
  , created: Float -- ms timestamp
  }


type alias Idea = 
  { title: String
  , content: String
  , created: Float -- ms timestamp
  }


type Msg 
  = NoMsg
  | SetPage Page
  | SetSearch Bool
  | ToggleSort


type Page
  = Ideas
  | Statistics
  | Settings
  | NewIdea


type ListSelection 
  = All
  | None
  | Some (Set String)


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