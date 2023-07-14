package example_rbac

default allow = false

# allow will be true when user has role and role has permission
allow {
    trace("##")
    trace(role_name)
	user_has_role[role_name]
	role_has_permission[role_name]
}

# check user role binding exist
user_has_role[role_name] {
	role_binding = data.bindings[_] with data.bindings as data_context.bindings
	role_binding.role = role_name
	role_binding.user = input.subject.user
}

# check role permission exist
role_has_permission[role_name] {
	role = data.roles[_] with data.roles as data_context.roles
	role.name = role_name
	role.operation = input.action.operation
	role.resource = input.action.resource
}


data_context={
    "roles": [
        {
            "operation": "read",
            "resource": "widgets",
            "name": "widget-reader"
        },
        {
            "operation": "write",
            "resource": "widgets",
            "name": "widget-writer"
        }
    ],
    "bindings": [
        {
            "user": "inspector-alice",
            "role": "widget-reader"
        },
        {
            "user": "maker-bob",
            "role": "widget-writer"
        }
    ]
}