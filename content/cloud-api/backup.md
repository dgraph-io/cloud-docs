+++
title = "Backup"
weight = 3
[menu.main]
    parent = "cloud-api"
    identifier = "backup"
+++

## List Backups

List all backups of the current backend.

### Cloud Endpoint

```
https://cerebro.cloud.dgraph.io/admin/slash
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
TODO
```

### Example

**Request**

```shell
curl "https://<deployment.url>/admin/slash" \
  -H 'Content-Type: application/json' \
  -H "X-Auth-Token: <deployment.jwtToken>" \
  --data-binary '{"query":"{\n listBackups {\n response {\n type\n backupNum\n folder\n timestamp\n }, errors {\n message\n }\n} \n}","variables":{}}' \
  --compressed
```

**Response**

```json
{
  "data": {
    "listBackups": {
      "errors": [],
      "response": [
        [
          {
            "backupNum": 1,
            "folder": "2021-15",
            "timestamp": "2021-04-15T18:00:58+0000",
            "type": "full"
          }
        ]
      ]
    }
  }
}
```

## Export Data

Export data from your backend.

### Cloud Endpoint

```
https://cerebro.cloud.dgraph.io/admin/slash
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
TODO
```

### Example

**Request**

```shell
curl "https://<deployment.url>/admin/slash" \
  -H 'Content-Type: application/json' \
  -H "X-Auth-Token: <deployment-jwt-token>" \
  --data-binary '{"query":"mutation {\n export {\n signedUrls\n }\n }","variables":{}}' \
  --compressed
```

**Response**

```json
{
  "data": {
    "export": {
      "signedUrls": [
        "<export-url>",
        "<export-url>",
        "<export-url>"
      ]
    }
  }
}
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

