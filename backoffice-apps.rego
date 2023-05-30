package backoffice

import future.keywords.in
import data.utils.hasPermission
import data.utils.accessibleByAnyone

allowedapps[app_name] {
  some app_name, app_value in data.backoffice.apps
  hasPermission(input[roles], app_value.allowedRoles)
}

alloweduicomponents[component_name] {
  some component_name, component_value in data.backoffice.uicomponents
  hasPermission(input[roles], component_value.allowedRoles)
}
