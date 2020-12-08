+++
title = "Drop"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "drop"
+++

Drop all data in your backend.

USAGE
```
  $ slash-graphql drop
```

OPTIONS
```
  -F, --drop-fields=drop-fields  Drop types
  -T, --drop-types=drop-types    Drop types
  -d, --drop-data                Drop data and leave the schema
  -e, --endpoint=endpoint        Slash GraphQL Endpoint
  -l, --list-unused              List unused types and fields
  -q, --quiet                    Quiet Output
  -s, --drop-schema              Drop Schema along with the data
  -t, --token=token              Slash GraphQL Backend API Tokens
  -u, --drop-unused              Drops all unused types and fields
  -y, --confirm                  Skip Confirmation
```

EXAMPLE
```
  $ slash-graphql drop -e https://frozen-mango.cloud.dgraph.io/graphql -t <apiToken> [-l] [-d] [-s] [-T <types>] [-F 
  <fields>]
```
