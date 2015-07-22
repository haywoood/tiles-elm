import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import StartApp
import List exposing (..)
import Signal exposing (..)

main =
  StartApp.start { model = model, view = view, update = update }


type alias Tile =
  { color: String
  , bgColor: String
  }

type alias Model = { tiles: List Tile }
model = { tiles = repeat 1000 { color = "red", bgColor = "white" } }

tiletpl : Address action -> Tile -> Html
tiletpl address tile =
  div
    [ style
        [ ("width", "5px")
        , ("height", "17px")
        , ("background-color", tile.bgColor)
        , ("position", "relative")
        ]
    ]
    [ div
        [ style
            [ ("height", "5px")
            , ("background-color", tile.color)
            , ("width", "5px")
            , ("border-radius", "5px")
            , ("position", "absolute")
            , ("top", "6px")
            , ("left", "3px")
            ]
        ]
        []
    ]

view : Address action -> Model -> Html
view address model =
  div
    [ style
        [ ("width", "500px")
        , ("height", "800px")
        ]
    ]
    (List.map (tiletpl address) model.tiles)

type Action = Increment

update action model =
  case action of
    Increment -> model
