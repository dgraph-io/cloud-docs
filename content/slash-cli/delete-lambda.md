+++
title = "Delete Lambda"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "delete-lambda"
+++

Delete the Lambda script associated with the backend.

USAGE
```
  $ slash-graphql delete-lambda
```
OPTIONS
```
  -e, --endpoint=endpoint  Slash GraphQL Endpoint
  -q, --quiet              Quiet Output
  -t, --token=token        Slash GraphQL Backend API Tokens
  -y, --confirm            Skip Confirmation
```
EXAMPLES
```
  $ slash-graphql delete-lambda -e https://frozen-mango.cloud.dgraph.io/graphql
  $ slash-graphql delete-lambda -e 0x1234
```