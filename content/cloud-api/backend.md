+++
title = "Backend"
weight = 3
[menu.main]
    parent = "cloud-api"
    identifier = "backend"
+++

## List Backends

List backends that you have access to.

This API requires authentication, please see [Authentication](/dgraph-cloud-api/authentication) for instructions on issuing and passing a JWT token to the API.

### Cloud Endpoint

```
https://cerebro.cloud.dgraph.io/graphql
```

### API Command

```graphql
{
  deployments {
    uid
    name
    zone
    url
    owner
    jwtToken
    deploymentMode
    deploymentType
    lambdaScript
  }
}
```

### Example

**Request**

```shell
curl 'https://cerebro.cloud.dgraph.io/graphql' \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer <jwt-token>" \
  --data-binary '{"query":"{\n deployments {\n uid\n name\n zone\n url\n owner\n jwtToken\n deploymentMode\n deploymentType\n lambdaScript\n }\n}","variables":{}}' \
  --compressed
```

**Response**

```json
{
  "data": {
    "deployments": [
      {
        "uid": "0xf0ffe9",
        "name": "testing",
        "zone": "us-east-1",
        "url": "polished-violet.us-east-1.aws.cloud.dgraph.io",
        "owner": "486c69b4-e09b-48f9-a28a-86314fe232cd",
        "jwtToken": "<deployment-jwt-token>",
        "deploymentMode": "graphql",
        "deploymentType": "free",
        "lambdaScript": ""
      }
    ]
  }
}
```

For any `/admin` or `/admin/slash` requests to `https://<deployment.url>`, you **must use the `<deployment-jwt-token>` returned above in the `X-Auth-Token` header** instead of the Login JWT token in the `Authorization` header.

## Deploy Backend

Launch a new backend.

This API requires authentication, please see [Authentication](/dgraph-cloud-api/authentication) for instructions on issuing and passing a JWT token to the API.

### Cloud Endpoint

```
https://cerebro.cloud.dgraph.io/graphql
```

### API Command

```graphql
mutation CreateDeployment($dep: NewDeployment!) {
  createDeployment(input: $dep) {
      uid
      name
      url
      jwtToken
    }
}
```

Variables
```
deployment - parameters for the new deployment
  name - name of the deployment
  zone - region to launch
  deploymentType - The type of the deployment (free|shared|dedicated)
```

### Example

**Request**

```shell
curl 'https://cerebro.cloud.dgraph.io/graphql' \
  -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer <jwt-token>' \
  --data-binary '{"query":"mutation CreateDeployment($deployment: NewDeployment!) {\n  createDeployment(input: $deployment) {\n    uid\n    name\n    url\n    jwtToken\n  }\n}","variables":{"deployment":{"name":"My New Deployment","zone":"us-east-1","deploymentType":"dedicated"}}}' \
  --compressed
```

**Response**

```json
{
  "data": {
    "createDeployment": {
      "uid": "0x42",
      "name": "My New Deployment",
      "url": "my-new-deployment.us-east-1.aws.cloud.dgraph.io",
      "jwtToken": "<deployment-jwt-token>"
    }
  }
}
```

## Update Backend

Update backend.

This API requires authentication, please see [Authentication](/dgraph-cloud-api/authentication) for instructions on issuing and passing a JWT token to the API.

### Cloud Endpoint

```
https://cerebro.cloud.dgraph.io/graphql
```

### API Command

```graphql
mutation UpdateDeployment($dep: UpdateDeploymentInput!) {
  updateDeployment(input: $dep)
}
```

OPTIONS
```

```

### Example

**Request**

```shell
```

**Response**

```

```

## Destroy Backend

Destroy (i.e., delete) a backend by id.

This API requires authentication, please see [Authentication](/dgraph-cloud-api/authentication) for instructions on issuing and passing a JWT token to the API.

### Cloud Endpoint

```
https://cerebro.cloud.dgraph.io/graphql
```

### API Command

```graphql
mutation DeleteDeployment($deploymentID: String!) {
  deleteDeployment(deploymentID: $deploymentID)
}
```

OPTIONS
```

```

### Example

```shell
curl 'https://cerebro.cloud.dgraph.io/graphql' \
  -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer <jwt-token>' \
  --data-binary '{"query":"mutation DeleteDeployment($deploymentUid: String!) {\n  deleteDeployment(deploymentID: $deploymentUid)\n}","variables":{"deploymentUid":"0x42"}}' --compressed
```

Please see the example response below

```
{
  "data": {
    "deleteDeployment": "Successfully deleted the Deployment"
  }
}
```

## Restore Backends

Restore into a backend by source backend ID.

### Cloud Endpoint

```
https://cerebro.cloud.dgraph.io/admin/slash
```

### API Command

```graphql
mutation($uid: String!, $backupFolder: String, $backupNum: Int) {
  restore(uid: $uid, backupFolder: $backupFolder, backupNum: $backupNum) {
    response {
      code
      message
      restoreId
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

## Restore Backend Status

Retrieve the status of a restore operation.

### Cloud Endpoint

```
https://cerebro.cloud.dgraph.io/admin/slash
```

### API Command

```graphql
query($restoreId: Int!) {
  restoreStatus(restoreId: $restoreId) {
    response {status errors}
  }
}
```

OPTIONS
```

```

### Example

```

```

## Drop

Drop (i.e., delete) all data in your backend.

### Cloud Endpoint

```
https://cerebro.cloud.dgraph.io/admin/slash
```

### API Command

```graphql
DROP_DATA  =
mutation {
  dropData(allData: true) {
    response { code message }
  }
}`

DROP_SCHEMA  =
mutation {
  dropData(allDataAndSchema: true) {
    response { code message }
  }
}

DROP_TYPES =
mutation($types: [String!]) {
  dropData(types: $types) {
    response { code message }
  }
}


DROP_FIELDS =
mutation($fields: [String!]) {
  dropData(fields: $fields) {
    response { code message }
  }
}
```

OPTIONS
```

```

### Example

```

```
