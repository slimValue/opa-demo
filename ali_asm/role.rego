package istio.authz
import input.attributes.request.http as http_request
allow {
    roles_for_user[r]
    required_roles[r]
}
roles_for_user[r] {
    r := user_roles[user_name][_]
}
required_roles[r] {
    perm := role_perms[r][_]
    perm.method = http_request.method
    perm.path = http_request.path
}
user_name = parsed {
    [_, encoded] := split(http_request.headers.authorization, " ")
    [parsed, _] := split(base64url.decode(encoded), ":")
}
user_roles = {
    "guest1": ["guest"],
    "admin1": ["admin"]
}
role_perms = {
    "guest": [
        {"method": "GET",  "path": "/productpage"},
    ],
    "admin": [
        {"method": "GET",  "path": "/productpage"},
        {"method": "GET",  "path": "/api/v1/products"},
    ],
}



