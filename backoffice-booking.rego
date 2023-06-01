package backoffice.booking

allowAction(actionType, properties) {
    allowActionWithBooking(actionType, properties)
}

allowActionWithBooking("create", properties) {
    action.resource == "booking"
}