+++
title = "Import Data"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "import-data"
+++

Import your data back via live loader (requires docker).

USAGE
```
  $ slash-graphql import-data INPUT
```

ARGUMENTS
```
  INPUT  Input Directory
```

OPTIONS
```
  -e, --endpoint=endpoint  Slash GraphQL Endpoint
  -q, --quiet              Quiet Output
  -t, --token=token        Slash GraphQL Backend API Tokens
  -y, --confirm            Skip Confirmation
```

EXAMPLE
```
  $ slash-graphql import-data -e https://frozen-mango.cloud.dgraph.io/graphql -t <apiToken> ./import-directory
```
