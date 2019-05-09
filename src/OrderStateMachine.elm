module OrderStateMachine exposing (CancelledOrder, InitialOrder, LostOrder, ProcessingOrder, ShippedOrder, ShippingOrder, cancelInitial, cancelProcessing, initOrder, loose, process, ship, shipped)


type InitialOrder order
    = InitialOrder order


type ProcessingOrder order
    = ProcessingOrder order


type CancelledOrder order
    = CancelledOrder order


type ShippingOrder order
    = ShippingOrder order


type ShippedOrder order
    = ShippedOrder order


type LostOrder order
    = LostOrder order


initOrder : o -> InitialOrder o
initOrder order =
    InitialOrder order


process : InitialOrder order -> ProcessingOrder order
process initial =
    let
        (InitialOrder order) =
            initial
    in
    ProcessingOrder order


cancelProcessing : ProcessingOrder order -> CancelledOrder order
cancelProcessing processing =
    let
        (ProcessingOrder o) =
            processing
    in
    CancelledOrder o


cancelInitial : InitialOrder order -> CancelledOrder order
cancelInitial processing =
    let
        (InitialOrder order) =
            processing
    in
    CancelledOrder order


ship : ProcessingOrder order -> ShippingOrder order
ship processing =
    let
        (ProcessingOrder order) =
            processing
    in
    ShippingOrder order


shipped : ShippingOrder order -> ShippedOrder order
shipped shipping =
    let
        (ShippingOrder order) =
            shipping
    in
    ShippedOrder order


loose : ShippingOrder order -> LostOrder order
loose shipping =
    let
        (ShippingOrder order) =
            shipping
    in
    LostOrder order
