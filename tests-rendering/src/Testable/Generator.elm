module Testable.Generator exposing (..)

{-| -}

import Testable
import Testable.Element exposing (..)
import Testable.Element.Background as Background
import Testable.Element.Font as Font


{-| Given a list of attributes, generate every context this list of attributes could be in.

So, this means,

    - every element type
    - in every element type

-}
element : String -> List (Testable.Attr msg) -> List ( String, Testable.Element msg )
element label attrs =
    -- [ ( label, paragraph attrs [ short ] )
    -- ]
    mapEveryCombo
        (\makeLayout child ->
            ( label, makeLayout attrs child )
        )
        layouts
        contents


mapEveryCombo fn listOne listTwo =
    List.concatMap
        (\one ->
            List.map
                (\two ->
                    fn one two
                )
                listTwo
        )
        listOne


layouts =
    [ \attrs child ->
        el attrs child
    , \attrs child ->
        row attrs [ child ]
    , \attrs child ->
        column attrs [ child ]
    , \attrs child ->
        paragraph attrs [ child ]
    , \attrs child ->
        textColumn attrs [ child ]
    ]


nearbys =
    [ inFront
    , above
    , onLeft
    , onRight
    , below
    , behindContent
    ]


contents =
    [ none
    , text short
    , text lorem
    , el
        [ width (px 50)
        , height (px 50)
        , Background.color (rgb (240 / 255) 0 (245 / 255))
        , Font.color (rgb 1 1 1)
        ]
        none
    ]


short =
    "short and small"


lorem =
    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."