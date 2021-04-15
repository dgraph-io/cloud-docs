+++
title = "Schema"
weight = 2
[menu.main]
    parent = "cloud-api"
    identifier = "schema"
+++

## Get Schema

Fetch the schema from your backend.

### Cloud Endpoint

```
https://cerebro.cloud.dgraph.io/admin
```

### API Command

```graphql
{
  getGQLSchema {
    schema
    generatedSchema
  }
}
```

ARGUMENTS

```
TODO
```


### Example

**Request**

```shell
#!/usr/bin/env bash

DEPLOYMENT_URL="polished-violet.us-east-1.aws.stage.thegaas.com"
DEPLOYMENT_JWT="<deployment-jwt-token>"

curl "https://${DEPLOYMENT_URL}/admin" \
  -H "Content-Type: application/json" \
  -H "X-Auth-Token: ${DEPLOYMENT_JWT}" \
  --data-binary '{"query":"{\n getGQLSchema {\n schema\n generatedSchema\n }\n}","variables":{}}' \
  --compressed
```

**Response**

```json
{
  "data": {
    "getGQLSchema": null
  },
  "extensions": {
    "tracing": {
      "version": 1,
      "startTime": "2021-04-15T18:37:06.44358101Z",
      "endTime": "2021-04-15T18:37:06.443779787Z",
      "duration": 198788,
      "execution": {
        "resolvers": [
          {
            "path": [
              "getGQLSchema"
            ],
            "parentType": "Query",
            "fieldName": "getGQLSchema",
            "returnType": "GQLSchema",
            "startOffset": 148681,
            "duration": 34247,
            "dgraph": [
              {
                "label": "query",
                "startOffset": 151025,
                "duration": 1452
              }
            ]
          }
        ]
      }
    }
  }
}
```

## Update Schema

Update the schema in your backend.

### Cloud Endpoint

```
https://cerebro.cloud.dgraph.io/admin
```

### API Command

```graphql
mutation($sch: String!) {
  updateGQLSchema(input: { set: { schema: $sch } })
  {
    gqlSchema {
      schema
    }
  }
}
```

ARGUMENTS
```

```

### Example

```

```
