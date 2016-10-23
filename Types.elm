module Types exposing (..)

import Set exposing (Set)
import Dict exposing (Dict)
import Dom
import Random.Pcg

type alias Model = 
  { lists: Dict String List'
  , comboLists1: ListSelection
  , comboLists2: ListSelection
  , page: Page
  , editListName: Maybe String
  , editListItems: Maybe (List String)
  , editListItem: Maybe String
  , seed: Random.Pcg.Seed
  , t: Float
  }


type alias List' = 
  { name: String
  , items: List String
  , created: Float -- millisecond timestamp
  }


type Msg 
  = NoMsg


type Page
  = Ideas


type ListSelection 
  = All
  | None
  | Some (Set String)


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