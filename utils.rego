package utils

hasPermissionByRole(grants, roles) {
    some granted_role in grants
    granted_role in roles
}