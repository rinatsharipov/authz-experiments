package backoffice

import future.keywords.in

allowedapps[app_name] {
  some app_name, app_value in data.backoffice.apps

  # with use key notation instead of .dot notation to prevent issues in case
  # role contains whitespaces
  some role in input[roles]
  role in app_value.allowedRoles
}

alloweduicomponents[component_name] {
  some component_name, component_value in data.backoffice.uicomponents

  # with use key notation instead of .dot notation to prevent issues in case
  # role contains whitespaces
  some role in input[roles]
  role in component_value.allowedRoles
}
