+++
title = "Update Lambda"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "update-lambda"
+++

Get the Lambda script associated with the backend.

USAGE
```
  $ slash-graphql update-lambda
```

OPTIONS
```
  -e, --endpoint=endpoint  Slash GraphQL Endpoint
  -f, --file=file          (required) Lambda script file path.
  -q, --quiet              Quiet Output
  -t, --token=token        Slash GraphQL Backend API Tokens
```

EXAMPLES
```
  $ slash-graphql update-lambda -e https://frozen-mango.cloud.dgraph.io/graphql -f <filepath>
  $ slash-graphql update-lambda -e 0x1234 -f /home/user/Downloads/script.js
```
