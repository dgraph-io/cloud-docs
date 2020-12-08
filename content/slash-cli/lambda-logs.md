+++
title = "Lambda Logs"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "lambda-logs"
+++

Get the Lambda script associated with the backend.

USAGE
```
  $ slash-graphql lambda-logs
```

OPTIONS
```
  -e, --endpoint=endpoint  Slash GraphQL Endpoint
  -h, --hours=hours        [default: 1] Show lambda logs for last given hours. Defaults to 1 hour.
  -q, --quiet              Quiet Output
  -t, --token=token        Slash GraphQL Backend API Tokens
```

EXAMPLES
```
  $ slash-graphql lambda-logs -e https://frozen-mango.cloud.dgraph.io/graphql
  $ slash-graphql lambda-logs -e 0x1234 -h 5
```
