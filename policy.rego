package backoffice

import future.keywords.in

allowedapps[app.name] {
  some app in data.backoffice.apps

  # with use key notation instead of .dot notation to prevent issues in case
  # role contains whitespaces
  some role in input[roles]
  role in app.allowedRoles
}


allowedapps2[app] {
  some name, app in data.backoffice.apps2

  print(app)

  # with use key notation instead of .dot notation to prevent issues in case
  # role contains whitespaces
  some role in input[roles]
  role in app.allowedRoles
}
