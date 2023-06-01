package backoffice.booking

allowAction(actionType, properties) {
    allowActionWithBooking(actionType, properties)
}

allowActionWithBooking("create", properties) {
    properties.type == "treatment_internal"
}