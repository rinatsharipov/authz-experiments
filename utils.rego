package utils

import future.keywords.in

hasPermissionByRole(grants, roles) {
    some granted_role in grants
    granted_role in roles
}