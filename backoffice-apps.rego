package backoffice

import future.keywords.in
import data.utils.hasPermission
import data.backoffice.booking

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

    allowActionWithResource(input.action.resource)
}

allowActionWithResource("booking", type, properties) := {
    data.backoffice.booking.allowAction(type, properties)
}