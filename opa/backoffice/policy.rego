package backoffice

import future.keywords.in

allowedapps[app.name] {
  some app in data.backoffice.apps

  # with use key notation instead of .dot notation to prevent issues in case
  # role contains whitespaces
  some role in input[roles]
  role in app.allowedRoles
}
