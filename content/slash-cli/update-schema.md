+++
title = "Update Schema"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "update-schema"
+++

Update the schema in your backend.

USAGE
```
  $ slash-graphql update-schema [FILE]
```

ARGUMENTS
```
  FILE  [default: /dev/stdin] Input File
```

OPTIONS
```
  -e, --endpoint=endpoint  Slash GraphQL Endpoint
  -q, --quiet              Quiet Output
  -t, --token=token        Slash GraphQL Backend API Tokens
```

EXAMPLE
```
  $ slash-graphql update-schema -e https://frozen-mango.cloud.dgraph.io/graphql -t <apiToken> schema-file.graphql
```
