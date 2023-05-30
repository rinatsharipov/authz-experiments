package utils

import future.keywords.in

hasPermission(grants, roles) {
    accessibleByAnyone(roles)
    hasPermissionByRole(grants, roles)
}

hasPermissionByRole(grants, roles) {
    some granted_role in grants
    granted_role in roles
}

accessibleByAnyone(roles) {
    "*" in roles
}