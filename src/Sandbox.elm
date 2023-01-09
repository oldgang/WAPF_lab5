module Sandbox exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Row as Row



-- MAIN


main : Program () Model Msg
main = Browser.sandbox
            { init = init
            , view = view
            , update = update
            }

-- MODEL


type alias Model = {showDetails : Bool}


init : Model
init = {showDetails = True}

-- UPDATE

type Msg
    = ToggleDetails


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleDetails -> 
            if model.showDetails == True then
                {model | showDetails = False}
            else
                {model | showDetails = True}




-- VIEW


view : Model -> Html Msg
view model =
    Grid.container []
    [   CDN.stylesheet
        ,Grid.row[Row.centerXs][
            Grid.col [][h1 [] [ text "Food gallery" ]]]
        ,Grid.row[Row.centerXs][
            Grid.col [][button [onClick ToggleDetails] [ text "Toggle descriptions" ]]]
        ,Grid.row[Row.centerXs][
            Grid.col [][viewPhotoAndDetails model "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/gnocchi-1d16725.jpg?quality=90&resize=440,400" 
                                    "Chorizo & mozzarella gnocchi bake"]
            ,Grid.col [][viewPhotoAndDetails model "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/one-pan-spaghetti-with-nduja-fennel-olives-2308fb3.jpg?quality=90&webp=true&resize=300,272" 
                                    "One-pan spaghetti with nduja, fennel & olives"]
            ,Grid.col [][viewPhotoAndDetails model "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/easy-chicken-curry-aa22a0b.jpg?quality=90&webp=true&resize=300,272" 
                                    "Easy chicken curry"]]
    ]

viewPhotoAndDetails : Model -> String -> String -> Html msg
viewPhotoAndDetails model source description =
    if model.showDetails == True then
        div[]
        [
            img [ src source ] []
            , h2 [] [ text description ]
            , text ("Source: " ++ source)
        ]
    else
        div[]
        [
            img [ src source ] []
            , h2 [] [ text description ]
        ]


-- images taken from -> https://www.bbcgoodfood.com/recipes/collection/easy-recipes

-- Chorizo & mozzarella gnocchi bake -> https://www.bbcgoodfood.com/recipes/chorizo-mozzarella-gnocchi-bake
-- Upgrade cheesy tomato pasta with gnocchi, chorizo and mozzarella for a comforting bake that makes an excellent midweek meal
-- image: https://images.immediate.co.uk/production/volatile/sites/30/2020/08/gnocchi-1d16725.jpg?quality=90&resize=440,400

-- One-pan spaghetti with nduja, fennel & olives -> https://www.bbcgoodfood.com/recipes/one-pan-spaghetti-nduja-fennel-olives
-- A spicy sausage pasta dish with a difference. Using the cooking water helps the sauce cling to the pasta and gives the dish more body. A silky smooth sauce, perfect pasta and one pan to wash!
-- image: https://images.immediate.co.uk/production/volatile/sites/30/2020/08/one-pan-spaghetti-with-nduja-fennel-olives-2308fb3.jpg?quality=90&webp=true&resize=300,272

-- Easy chicken curry -> https://www.bbcgoodfood.com/recipes/easy-chicken-curry
-- This easy staple chicken curry is a fantastic recipe for family dinners. It's made with just a handful of ingredients and is enriched with creamy yogurt
-- image: https://images.immediate.co.uk/production/volatile/sites/30/2020/08/easy-chicken-curry-aa22a0b.jpg?quality=90&webp=true&resize=300,272