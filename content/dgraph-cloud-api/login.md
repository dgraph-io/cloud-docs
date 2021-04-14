+++
title = "Login"
weight = 2
[menu.main]
    parent = "dgraph-cloud-api"
    identifier = "login"
+++

## Login

Login to Dgraph Cloud. Calling this function will keep you logged in for 24 hours, and you will not need to pass access tokens for any backends that you own.

### Cloud Endpoint

```
/graphql
```

### API Command

```graphql
query login($email: String!, $password: String!) {
  login(email: $email, password: $password) {
    token
  }
}
```

OPTIONS
```

```

### Example

```

```

## Logout

Logout of Dgraph Cloud CLI.

OPTIONS

```

```

EXAMPLES

```

```
