+++
title = "Backend"
weight = 3
[menu.main]
    parent = "cloud-api"
    identifier = "backend"
+++

## List Backends

List backends that you have access to.

{{% notice "note" %}}
This API requires authentication, please see [Authentication](/dgraph-cloud-api/authentication) for instructions on issuing and passing a JWT token to the API.
{{% /notice %}}

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

* `<cerebro-jwt>` is the JWT returned from [Authentication](/dgraph-cloud-api/authentication).

```bash
#!/usr/bin/env bash

CEREBRO_JWT="<cerebro-jwt>"

curl 'https://cerebro.cloud.dgraph.io/graphql' \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer ${CEREBRO_JWT}" \
  --data-binary '{"query":"{\n deployments {\n uid\n name\n zone\n url\n owner\n jwtToken\n deploymentMode\n deploymentType\n lambdaScript\n }\n}","variables":{}}' \
  --compressed
```

**Response**

* `<lambda-token>` is a base64 string that will be non-empty if you have saved [Lambdas](/lambda) on your backend

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
        "jwtToken": "<deployment-jwt>",
        "deploymentMode": "graphql",
        "deploymentType": "free",
        "lambdaScript": "<lambda-token>"
      }
    ]
  }
}
```

{{% notice "note" %}}
For any `/admin` or `/admin/slash` requests to `https://<deployment.url>`, you **must use the `<deployment-jwt>` returned above in the `X-Auth-Token` header.** The Cerebro JWT is only used in the `Authorization` header for requests to `https://cerebro.cloud.dgraph.io/graphql`.
{{% /notice %}}

## Deploy Backend

Launch a new backend.

{{% notice "note" %}}
This API requires authentication, please see [Authentication](/dgraph-cloud-api/authentication) for instructions on issuing and passing a JWT to the API.
{{% /notice %}}

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

**Arguments**

* `deployment`: parameter object for new deployment
  * `name`: name of the deployment
  * `zone`: region to launch
  * `deploymentType`: type of deployment `(free|shared|dedicated)`


### Example

**Request**

* `<cerebro-jwt>` is the JWT returned from [Authentication](/dgraph-cloud-api/authentication).

```bash
#!/usr/bin/env bash

CEREBRO_JWT="<cerebro-jwt>"

curl 'https://cerebro.cloud.dgraph.io/graphql' \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer ${CEREBRO_JWT}" \
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
      "jwtToken": "<deployment-jwt>"
    }
  }
}
```

## Update Backend

Update backend.

{{% notice "note" %}}
This API requires authentication, please see [Authentication](/dgraph-cloud-api/authentication) for instructions on issuing and passing a JWT token to the API.
{{% /notice %}}

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

**Arguments**

* `dep`: parameter object for update deployment
  * `dep.uid` (required): deployment `uid`

### Example

**Request**

* `<cerebro-jwt>` is the JWT returned from [Authentication](/dgraph-cloud-api/authentication).
* `<deployment-uid>` is the UID returned from [List Backends](#list-backends).

```bash
#!/usr/bin/env bash

CEREBRO_JWT="<cerebro-jwt>"

curl 'https://cerebro.cloud.dgraph.io/graphql' \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer ${CEREBRO_JWT}" \
  --data-binary '{"query":"mutation UpdateDeployment($dep: UpdateDeploymentInput!) {\n updateDeployment(input: $dep)\n}","variables":{"dep":{"uid":"<deployment.uid>","name":"My Deployment!"}}}' \
  --compressed
```

**Response**

```json
{
  "data": {
    "updateDeployment": "Successfully Updated the backend"
  }
}
```

## Destroy Backend

Destroy (i.e., delete) a backend by id.

{{% notice "note" %}}
This API requires authentication, please see [Authentication](/dgraph-cloud-api/authentication) for instructions on issuing and passing a JWT token to the API.
{{% /notice %}}

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

**Arguments**

* `deploymentUid` (required): deployment `uid` returned from [List Backends](#list-backends) request

### Example

**Request**

* `<cerebro-jwt>` is the JWT returned from [Authentication](/dgraph-cloud-api/authentication).

```bash
#!/usr/bin/env bash

CEREBRO_JWT="<cerebro-jwt>"

curl 'https://cerebro.cloud.dgraph.io/graphql' \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer ${CEREBRO_JWT}" \
  --data-binary '{"query":"mutation DeleteDeployment($deploymentUid: String!) {\n  deleteDeployment(deploymentID: $deploymentUid)\n}","variables":{"deploymentUid":"<deployment.uid>"}}' \
  --compressed
```

**Response**

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

```bash
https://${DEPLOYMENT_URL}/admin/slash
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

**Arguments**

* `uid` (required): the deployment `uid` from List Backends
* `backupFolder` (required): TODO
* `backupNum` (required): TODO

### Example

**Request**

```bash
#!/usr/bin/env bash

DEPLOYMENT_URL="polished-violet.us-east-1.aws.cloud.dgraph.io"
DEPLOYMENT_JWT="<deployment-jwt>"

curl "https://${DEPLOYMENT_URL}/admin/slash" \
  -H 'Content-Type: application/json' \
  -H "X-Auth-Token: ${DEPLOYMENT_JWT}" \
  --data-binary '{"query":"mutation($uid: String!, $backupFolder: String, $backupNum: Int) {\n restore(uid: $uid, backupFolder: $backupFolder, backupNum: $backupNum) {\n response {\n code\n message\n restoreId\n }, errors {\n message\n }\n}\n}","variables":{"uid":"<deployment-uid>","backupFolder":"<backup-folder>","backupNum":<backup-num>}}' \
  --compressed
```

**Response**

```json
{
  "data": {
    "restore": {
      "errors": null,
      "response": {
        "code": "Success",
        "message": "Restore operation started.",
        "restoreId": 1
      }
    }
  }
}
```

## Restore Backend Status

Retrieve the status of a restore operation.

### Cloud Endpoint

```bash
https://${DEPLOYMENT_URL}/admin/slash
```

### API Command

```graphql
query($restoreId: Int!) {
  restoreStatus(restoreId: $restoreId) {
    response {status errors}
  }
}
```

**Arguments**

* `restoreId` (required): the id of the restore operation returned from [Restore Backends](#restore-backends) request

### Example

**Request**

```bash
#!/usr/bin/env bash

DEPLOYMENT_URL="polished-violet.us-east-1.aws.stage.thegaas.com"
DEPLOYMENT_JWT="<deployment-jwt>"

curl "https://${DEPLOYMENT_URL}/admin/slash" \
  -H 'Content-Type: application/json' \
  -H "X-Auth-Token: ${DEPLOYMENT_JWT}" \
  --data-binary '{"query":"query($restoreId: Int!) {\n restoreStatus(restoreId: $restoreId) {\n response {status errors}\n}\n}","variables":{"restoreId":1}}' \
  --compressed
```

**Response**

```json
{
  "data": {
    "restoreStatus": {
      "response": {
        "errors": [],
        "status": "OK"
      }
    }
  }
}
```

## Drop

Drop (i.e., delete) all data in your backend.

### Cloud Endpoint

```bash
https://${DEPLOYMENT_URL}/admin/slash
```

### API Command

#### Drop Data

```graphql
mutation {
  dropData(allData: true) {
    response { code message }
  }
}
```

#### Drop Schema

```graphql
mutation {
  dropData(allDataAndSchema: true) {
    response { code message }
  }
}
```

#### Drop Types

```graphql
mutation($types: [String!]) {
  dropData(types: $types) {
    response { code message }
  }
}
```

#### Drop Fields

```graphql
mutation($fields: [String!]) {
  dropData(fields: $fields) {
    response { code message }
  }
}
```

**Arguments**

`TODO`

### Example

**Request**

```bash
#!/usr/bin/env bash

DEPLOYMENT_URL="polished-violet.us-east-1.aws.stage.thegaas.com"
DEPLOYMENT_JWT="<deployment-jwt>"

curl "https://${DEPLOYMENT_URL}/admin/slash" \
  -H 'Content-Type: application/json' \
  -H "X-Auth-Token: ${DEPLOYMENT_JWT}" \
  --data-binary '{"query":"mutation {\n dropData(allDataAndSchema: true) {\n response { code message }\n}\n}","variables":{}}' \
  --compressed
```

**Response**

```json
{
  "data": {
    "dropData": {
      "response": {
        "code": "Success",
        "message": "Done"
      }
    }
  }
}
```
