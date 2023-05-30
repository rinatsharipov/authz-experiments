package backoffice

import future.keywords.in
import future.utils.hasPermissionByRole

allowedapps[app_name] {
  some app_name, app_value in data.backoffice.apps
  utils.hasPermissionByRole(input[roles], app_value.allowedRoles)
}

alloweduicomponents[component_name] {
  some component_name, component_value in data.backoffice.uicomponents
  utils.hasPermissionByRole(input[roles], app_value.allowedRoles)
}
