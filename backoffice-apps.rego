package backoffice

import future.keywords.in
import data.utils.hasPermission

allowedapps[app_name] {
  some app_name, app_value in data.backoffice.apps
  hasPermission(input[roles], app_value.allowedRoles)
}

allowedbookingtypes[booking_type_name] {
  some booking_name, booking_value in data.backoffice.booking.types
  hasPermission(input[roles], app_value.allowedRoles)
}


