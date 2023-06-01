package backoffice

import future.keywords.in
import data.utils.hasPermission

allowedapps[app_name] {
  some app_name, app_value in data.backoffice.apps
  hasPermission(input[roles], app_value.allowedRoles)
}

allowedbookingtypes[booking_type_name] {
  some booking_type_name, booking_type_value in data.backoffice.booking.types
  hasPermission(input[roles], booking_type_value.allowedRoles)
}

default allowbooking := false

allowbooking := true {
  some allowed_booking_type in allowedbookingtypes
  regex.match(allowed_booking_type, input[bookingType])
}

default allowrequest := false

allowrequest := true {
    some role in input.user.roles
    role in  input.securityContext.allowedRoles
    input.user.roles in input.securityContext.allowedRoles
    #if isCreateBookingAction(input.action) {
    #    isBookingTypeAllowed(input.action.type)
    #}
}

#request_allowed := true {
#    input.user.roles in input.securityContext.allowedRoles

#    if isCreateBookingAction(input.action) {
#        isBookingTypeAllowed(input.action.type)
#    }
#}

isCreateBookingAction(action) {
    action.type == "create"
    action.resource == "booking"
}

isBookingTypeAllowed(bookingTypeName) {
    some allowed_booking_type in allowedbookingtypes
    regex.match(allowed_booking_type, input[bookingType])
}

booking_create_allowed {
    input.action.resource.properties.type in allowedbookingtypes
}

