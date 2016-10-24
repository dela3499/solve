module View exposing (..)

import Html exposing (Html, text, textarea, div, span, a, img, p, i, input, table, tr, td)
import Html.App as Html
import Html.Events exposing (onClick, onInput, onBlur, onFocus)
import Html.Attributes exposing (..)
import Maybe exposing (withDefault)
import Set exposing (Set)
import Dict exposing (Dict)
import String
import Types exposing (..)
import Util exposing (px)


app: Model -> Html Msg
app model =
  div 
    [ id "app" ] 
    [ case model.page of 
        Ideas -> 
          ideasPage model

        Statistics -> 
          statisticsPage model

        Settings -> 
          settingsPage model

        NewIdea -> 
          newIdeaPage model

        SelectLists1 -> 
          selectListsPage model 

        SelectLists2 -> 
          selectListsPage model 
    ] 


selectListsPage model = 
  let selectedLists = 
        case model.page of
          SelectLists1 -> model.selectedLists1
          SelectLists2 -> model.selectedLists2
          _ -> Set.empty
      lists = 
        div
          [ class "content lists" 
          , style [ ("top", model |> headerHeight |> px) ]
          ]        
          (model.lists
            |> List.sortBy .created
            |> List.map (list selectedLists)
          )
  in 
    div
      [ class "select-lists page" ]
      [ selectListsHeader model 
      , lists
      , footerMenu model.page
      ]


list selected list' = 
  let iconClass = 
        if Set.member list'.id selected then
          "fa fa-check-circle-o"
        else
          "fa fa-circle-o"
  in
    div
      [ class "list" 
      , onClick (ToggleList list'.id)
      ] 
      [ div 
          [ class "selector" ]
          [ i
              [ class iconClass ]
              []
          ]
      , div
          [ class "text" ]
          [ div
              [ class "title bold" ]
              [ text list'.title ]
          , div
              [ class "items medium" ]
              [ list'.items
                  |> String.join ", "
                  |> truncate 200
                  |> text 
              ]
          ]
      ]
                

selectListsHeader model = 
  div
    [ class "select-lists header material" 
    , style [("height", px headerRowHeight)]
    ]
    [ div
        [ class "back" ]
        [ i 
            [ class "fa fa-angle-left" 
            , onClick (SetPage NewIdea) 
            ]
            []    
        , span 
            [ class "medium new-idea"
            , onClick (SetPage NewIdea) 
            ] 
            [ text "New Idea" ]
        ]
    , span 
        [ class "medium"
        , onClick (SelectAllLists) 
        ] 
        [ text "Select All" ]
    , span 
        [ class "medium"
        , onClick (ClearAllLists) 
        ] 
        [ text "Clear All" ]                     
    ]


ideasPage model =
  div
    [ class "ideas page" ]
    [ if model.search then
        searchHeader model 
      else
        ideasHeader model
    , content (headerHeight model) (ideas model)
    , footerMenu model.page
    ]


statisticsPage model = 
  div
    [ class "statistics page" ]
    [ text "Statistics"
    , footerMenu model.page
    ] 


settingsPage model = 
  div
    [ class "settings page" ]
    [ text "Settings"
    , footerMenu model.page
    ]    
     

newIdeaPage model = 
  div
    [ class "new-idea page" ]
    [ div
        [ class "new-idea header material" 
        , style [ ("height", px (headerHeight model)) ]
        ]
        [ newIdeaHeaderTop model
        , newIdeaHeaderBottom model
        , div
            [ class "content" 
            , style [ ("top", model |> headerHeight |> px) ]
            ]
            [ div 
                [ class "title" ] -- need to add active thing here. 
                [ input 
                    [ placeholder "Title"
                    ]
                    []
                , i 
                    [ class "fa fa-times-circle" ]
                    []
                ]
            , textarea
                [ class "text"
                , placeholder "Describe your idea"
                ]
                []
            ]

        ]
    ]
          

newIdeaHeaderTop model = 
  let classes = 
        [ "cancel"
        , "label"
        , "save"
        ]
  in 
    div 
      [ class "header-row" 
      , style [("height", px headerRowHeight)]
      ]
      (List.map2 Util.wrap classes
        [ span 
            [ class "medium"
            , onClick (SetPage Ideas) ] 
            [ text "Cancel" ]
        , span 
            [] 
            [ text "New Idea" ]
        , span 
            [ class "medium bold" ] 
            [ text "Save" ]
        ]
      )


newIdeaHeaderBottom model = 
  let classes = 
        [ "combo"
        , "refresh"
        , "help"
        ]
  in 
    div 
      [ class "header-row" 
      , style [("height", px headerRowHeight)]
      ]
      (List.map2 Util.wrap classes
        [ div
            [] 
            [ div 
                [ class "item1" 
                , onClick (SetPage SelectLists1)
                ] 
                [ text model.randomItem1 ]
            , div
                [ class "item2" 
                , onClick (SetPage SelectLists2)
                ]  
                [ text model.randomItem2 ]
            ]
        , i   
            [ class "fa fa-refresh" 
            , onClick DrawRandomItems
            ]
            []
        ]
      )      


content top contents = 
  div
    [ class "content" 
    , style [ ("top", px top) ]
    ]
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


ideasHeader model = 
  let classes = 
        [ "search"
        , "date"
        , "arrow"
        , "pencil"
        , "trash"
        ]
  in 
    div 
      [ class "ideas header material" ]
      (List.map2 Util.wrap classes
        [ i 
            [ class "fa fa-search" 
            , onClick (SetSearch True)
            ]
            []
        , span 
            [ class "bold medium" 
            , onClick ToggleSort
            ] 
            [ text "date" ]
        , span 
            [ class "arrow medium" 
            , onClick ToggleSort
            ] 
            [ case model.sort of
                Ascending -> Util.upArrow 
                Descending -> Util.downArrow 
            ]
        , i 
            [ class "fa fa-pencil-square-o" 
            , onClick (SetPage NewIdea)
            ]
            []       
        , i 
            [ class "fa fa-trash-o" ]
            []    
        ]
      )


headerRowHeight = 
  120


headerHeight model = 
  case model.page of
    NewIdea -> 2 * headerRowHeight
    _ -> headerRowHeight


searchHeader model = 
  let wrap html = 
        div
          [ class "wrapper" ]
          [ html ]
  in 
    div 
      [ class "search ideas header material" ]
      (List.map wrap
        [ i 
            [ class "fa fa-angle-left" 
            , onClick (SetSearch False)
            ]
            []
        , input
            [ placeholder "Search ideas"
            ]
            []
        , i
            [ class "fa fa-times-circle" ]
            []
        ]
      )      


footerMenu currentPage = 
  let buttons = 
        [ (Ideas, "Ideas", "fa-lightbulb-o")
        , (Statistics, "Stats", "fa-pie-chart")
        , (Settings, "Settings", "fa-cog")
        ]
      activeTab page = 
        case page of
          Settings -> Settings
          Statistics -> Statistics
          _ -> Ideas      

      createButton (tab, label, icon) = 
        div
          [ classList
              [ ("button", True)
              , ("active", tab == (activeTab currentPage)) 
              ]
          , onClick (SetPage tab)  
          ]
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