+++
title = "Login"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "login"
+++

### Login

Login to Slash GraphQL. Calling this function will keep you logged in for 24 hours, and you will not need to pass access tokens for any backends that you own.

USAGE
```
  $ slash-graphql login
```

OPTIONS
```
  -q, --quiet  Quiet output
```

EXAMPLE
```
  $ slash-graphql login
```

### Logout

Logout of Slash GraphQL CLI.

USAGE

```
  $ slash-graphql logout
```

OPTIONS

```
  -a, --all    Log out of all command line clients
  -q, --quiet  Quiet output
```

EXAMPLES

```
  $ slash-graphql logout
  $ slash-graphql logout -a
```
