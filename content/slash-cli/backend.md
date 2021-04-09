+++
title = "Backend"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "backend"
+++

## Deploy Backend

Launch a new backend.

### Cloud Endpoint

```
/graphql
```

### API Command

```graphql
mutation CreateDeployment($dep: NewDeployment!) {
  createDeployment(input: $dep) {
      uid
      name
      url
      owner
      jwtToken
      deploymentMode
      lambdaScript
    }
}
```

OPTIONS
```

```

### Example

```

```

## List Backends

List your backends.

### Cloud Endpoint

```
/graphql
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
    lambdaScript
  }
}
```

OPTIONS
```

```

### Example

```

```

## Update Backend

Update backend.

### Cloud Endpoint

```
/graphql
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

```

```

## Destroy Backend

Destroy (i.e., delete) a backend by id.

### Cloud Endpoint

```
/graphql
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

```

```

## Restore Backends

Restore into a backend by source backend ID.

### Cloud Endpoint

```
/admin/slash
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
/admin/slash
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
/admin/slash
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
