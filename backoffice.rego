package backoffice

import future.keywords.in

allowedapps[app_name] {
  some app_name, app_value in data.backoffice.apps

  # with use key notation instead of .dot notation to prevent issues in case
  # role contains whitespaces
  some role in input[roles]
  role in app_value.allowedRoles
}
