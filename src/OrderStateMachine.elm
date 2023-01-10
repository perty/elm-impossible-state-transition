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
process (InitialOrder order) =
    ProcessingOrder order


cancelProcessing : ProcessingOrder order -> CancelledOrder order
cancelProcessing (ProcessingOrder o) =
    CancelledOrder o


cancelInitial : InitialOrder order -> CancelledOrder order
cancelInitial (InitialOrder order) =
    CancelledOrder order


ship : ProcessingOrder order -> ShippingOrder order
ship (ProcessingOrder order) =
    ShippingOrder order


shipped : ShippingOrder order -> ShippedOrder order
shipped (ShippingOrder order) =
    ShippedOrder order


loose : ShippingOrder order -> LostOrder order
loose (ShippingOrder order) =
    LostOrder order
