+++
title = "Export Data"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "export-data"
+++

Export data from your backend.

USAGE
```
  $ slash-graphql export-data OUTPUTDIR
```

ARGUMENTS
```
  OUTPUTDIR  Output Directory
```

OPTIONS
```
  -e, --endpoint=endpoint  Slash GraphQL Endpoint
  -q, --quiet              Quiet Output
  -t, --token=token        Slash GraphQL Backend API Tokens
```

EXAMPLE
```
  $ slash-graphql export-data -e https://frozen-mango.cloud.dgraph.io/graphql -t <apiToken> ./output-directory
```
