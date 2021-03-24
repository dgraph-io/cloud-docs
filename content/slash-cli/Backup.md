+++
title = "Backup"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "backup"
+++

### List Backups

List all backups of the current backend.

USAGE
```
  $ slash-graphql list-backups
```

OPTIONS
```
  -e, --endpoint=endpoint  Dgraph Cloud endpoint
  -q, --quiet              Quiet output
  -t, --token=token        Dgraph Cloud backend API tokens
```

EXAMPLE
```
  $ slash-graphql list-backups -e https://frozen-mango.cloud.dgraph.io/graphql -t <apiToken>
```
