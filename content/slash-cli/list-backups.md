+++
title = "List Backups"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "list-backups"
+++

List all backups of the current backend.

USAGE
```
  $ slash-graphql list-backups
```

OPTIONS
```
  -e, --endpoint=endpoint  Slash GraphQL Endpoint
  -q, --quiet              Quiet Output
  -t, --token=token        Slash GraphQL Backend API Tokens
```

EXAMPLE
```
  $ slash-graphql list-backups -e https://frozen-mango.cloud.dgraph.io/graphql -t <apiToken>
```
