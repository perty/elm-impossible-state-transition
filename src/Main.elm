module Main exposing (main)

{-
   Can we make impossible state transitions impossible as impossible state can be impossible?

   An order has this state machine: Initial -> { Processing, Cancelled }, Processing -> {Cancelled, Shipping},
   Shipping -> {Shipped, Lost}. So end states are Cancelled, Shipped and Lost.

   Let's see if can make the compiler catch when trying to cancel an order that is shipping.

-}

import Html exposing (Html, div, text)
import OrderStateMachine exposing (CancelledOrder, LostOrder, ShippedOrder, ShippingOrder, cancelInitial, cancelProcessing, initOrder, loose, process, ship, shipped)


type alias Order =
    { id : String
    }



-- Legal cases


initialProcessingCancel : Order -> CancelledOrder Order
initialProcessingCancel order =
    initOrder order |> process |> cancelProcessing


initialCancelled : Order -> CancelledOrder Order
initialCancelled order =
    initOrder order |> cancelInitial


initialProcessingShippingShipped : Order -> ShippedOrder Order
initialProcessingShippingShipped order =
    initOrder order |> process |> ship |> shipped


initialProcessingShippingLoose : Order -> LostOrder Order
initialProcessingShippingLoose order =
    initOrder order |> process |> ship |> loose



-- Illegal cases
-- When an order is shipping, it has left our building so you can't cancel it.
-- There is no "cancelShipping" function but also you can't use any other of
-- the cancel functions, cancelInitial or cancelProcessing


cancelShippingOrder : Order -> CancelledOrder Order
cancelShippingOrder order =
    let
        -- No such thing
        case1 =
            initOrder order |> process |> ship |> cancelShipping

        -- Can't cheat with the other cancelling functions
        case2 =
            initOrder order |> process |> ship |> cancelProcessing

        case3 =
            initOrder order |> process |> ship |> cancelInitial
    in
    case1



-- You can't ship without processing first


shipInitial : Order -> ShippingOrder Order
shipInitial order =
    initOrder order |> ship



-- You cn't loose an order that hasn't been shipped


looseProcessing : Order -> LostOrder Order
looseProcessing order =
    initOrder order |> process |> loose


main : Html msg
main =
    div []
        [ text "Hello"
        ]
