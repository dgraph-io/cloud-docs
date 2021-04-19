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

```bash
https://${DEPLOYMENT_URL}/admin/slash
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

### Example

{{% tabs %}} {{% tab "request" %}}
```bash
#!/usr/bin/env bash

DEPLOYMENT_URL="polished-violet.us-east-1.aws.cloud.dgraph.io"
DEPLOYMENT_JWT="<deployment-jwt>"
```

```sh
curl "https://${DEPLOYMENT_URL}/admin/slash" \
  -H 'Content-Type: application/json' \
  -H "X-Auth-Token: ${DEPLOYMENT_JWT}" \
  --data-binary '{"query":"{\n listBackups {\n response {\n type\n backupNum\n folder\n timestamp\n }, errors {\n message\n }\n} \n}","variables":{}}' \
  --compressed
```

{{% /tab %}} {{% tab "response" %}}
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
          },
          {
            "backupNum": 2,
            "folder": "2021-15",
            "timestamp": "2021-04-15T18:04:29+0000",
            "type": "incremental"
          }
        ]
      ]
    }
  }
}
```
{{% /tab %}} {{% /tabs %}}

## Export Data

Export data from your backend.

### Cloud Endpoint

```bash
https://${DEPLOYMENT_URL}/admin/slash
```

### API Command

```graphql
mutation {
  export {
    signedUrls
  }
}
```

### Example

{{% tabs %}} {{% tab "request" %}}
```bash
#!/usr/bin/env bash

DEPLOYMENT_URL="polished-violet.us-east-1.aws.cloud.dgraph.io"
DEPLOYMENT_JWT="<deployment-jwt>"
```

```sh
curl "https://${DEPLOYMENT_URL}/admin/slash" \
  -H 'Content-Type: application/json' \
  -H "X-Auth-Token: ${DEPLOYMENT_JWT}" \
  --data-binary '{"query":"mutation {\n export {\n signedUrls\n }\n }","variables":{}}' \
  --compressed
```

{{% /tab %}} {{% tab "response" %}}
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
{{% /tab %}} {{% /tabs %}}

## Import Data

Import your data back using Dgraph Live Loader (requires docker).

### Shell Command

Live loader (via docker)

```sh
docker run -it --rm -v `${inputFile}:/tmp/g01.json.gz` dgraph/dgraph:v20.07-slash
dgraph live `--slash_grpc_endpoint=${backend.getGRPCEndpoint()}` -f /tmp/g01.json.gz -t backend.getToken()
```

**Arguments**

`TODO`

### Example

{{% tabs %}} {{% tab "request" %}}
```bash
```

{{% /tab %}} {{% tab "response" %}}
```json
```
{{% /tab %}} {{% /tabs %}}
