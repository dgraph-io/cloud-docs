+++
title = "Backup"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "backup"
+++

## List Backups

List all backups of the current backend.

### Cloud Endpoint

```
/admin/slash
```

### API Command

```graphql
query {
    listBackups {
        response {
            type
            backupNum
            folder
            timestamp
        }, errors {
            message
        }
    }
}
```

OPTIONS
```

```

### Example

```

```

## Export Data

Export data from your backend.

### Cloud Endpoint
```
/admin/slash
```

### API Command

```graphql
mutation {
  export {
    signedUrls
  }
}
```

OPTIONS
```

```

### Example

```

```

## Import Data

Import your data back using Dgraph Live Loader (requires docker).

### Shell Command

Live loader (via docker)

```sh
docker run -it --rm -v `${inputFile}:/tmp/g01.json.gz` dgraph/dgraph:v20.07-slash
dgraph live `--slash_grpc_endpoint=${backend.getGRPCEndpoint()}` -f /tmp/g01.json.gz -t backend.getToken()
```

OPTIONS
```

```

### Example

```

```

