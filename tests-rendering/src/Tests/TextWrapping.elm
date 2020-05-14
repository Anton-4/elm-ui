module Tests.TextWrapping exposing (main, view)

import Html
import Testable
import Testable.Element exposing (..)
import Testable.Element.Background as Background
import Testable.Element.Font as Font
import Testable.Generator
import Testable.Runner
import Tests.Palette as Palette exposing (..)


box attrs =
    el
        ([ width (px 50)
         , height (px 50)
         , Background.color blue
         ]
            ++ attrs
        )
        none


{-| -}
main : Html.Html msg
main =
    Testable.Runner.show view


view =
    column [ paddingXY 0 100, spacing 16 ]
        [ paragraph []
            [ text Testable.Generator.lorem
            ]
        , paragraph []
            [ text Testable.Generator.lorem
            , text Testable.Generator.lorem
            ]
        , paragraph []
            [ text Testable.Generator.lorem
            , paragraph []
                [ text Testable.Generator.lorem ]
            ]
        ]
