package backoffice

import future.keywords.in

allowedapps[app] {
  some app in data.backoffice.apps[_]

  # with use key notation instead of .dot notation to prevent issues in case
  # role contains whitespaces
  some role in input[roles]
  role in app.allowedRoles
}
