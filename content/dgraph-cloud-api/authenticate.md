+++
title = "Authenticate"
weight = 2
[menu.main]
    parent = "dgraph-cloud-api"
    identifier = "Authenticate"
+++

## Login

Login will generate a JWT token that can be used to access other Dgraph Cloud APIs.

This API requires an email address and password. If you have signed up with a social media provider, you may create a new password by selecting `Forgot Password` on the login page.

### Cloud Endpoint

```
https://cerebro.dgraph.io/graphql
```

### API Command

```graphql
query Login($email: String!, $password: String!) {
  login(email: $email, password: $password) {
    token
  }
}
```

Variables
```
email - your email address
password - your password
```

### Example Response

Below is an example response. The token below must be passed to all future API calls via the `X-Auth-Token` header.

```
{
  "data": {
    "login": {
      "token": "<jwtTokenHere>"
    }
  }
}
```

