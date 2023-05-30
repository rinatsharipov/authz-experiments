package utils

import future.keywords.in

hasPermission(grants, roles) {
    "*" in roles
}

hasPermission(grants, roles) {
    some granted_role in grants
    granted_role in roles
}
