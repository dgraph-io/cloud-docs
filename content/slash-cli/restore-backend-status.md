+++
title = "Restore Backend Status"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "restore-backend-status"
+++

Retrieve the status of a restore operation.

USAGE
```
  $ slash-graphql restore-backend-status RESTOREID
```

ARGUMENTS
```
  RESTOREID  Restore ID
```

OPTIONS
```
  -e, --endpoint=endpoint  Slash GraphQL Endpoint
  -q, --quiet              Quiet Output
  -t, --token=token        Slash GraphQL Backend API Tokens
```

EXAMPLE
```
  $ slash-graphql restore-backend-status -e https://clone.cloud.dgraph.io/graphql -t <apiToken> "restoreID"
```
