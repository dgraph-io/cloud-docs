+++
title = "Lambda"
weight = 2
[menu.main]
    parent = "dgraph-cloud-api"
    identifier = "lambda"
+++

## Get Lambda Script

Get the Lambda script associated with the backend.

### Cloud Endpoint

```
/graphql
```

### API Command

1. Get backends
2. Match the backend id /endpoint url
3. Return the deployment.lambdascript value to the user

### Example

```

```

## Lambda Logs

Get the Lambda logs associated with the backend.

### Cloud Endpoint

```
/graphql
```

### API Command

```graphql
query GetLambdaLogs($input: LambdaLogsInput!) {
  getLambdaLogs(input: $input)
}
```

OPTIONS
```

```

### Example

```

```

## Update Lambda

Get the Lambda script associated with the backend.

### Cloud Endpoint

```
/graphql
```

### API Command

```graphql
mutation UpdateDeployment($input: UpdateDeploymentInput!) {
    updateDeployment(input: $input)
}
```


OPTIONS
```

```

### Example

```

```

## Delete Lambda

Delete the Lambda script associated with the backend.

### Cloud Endpoint

```
/graphql
```

### API Command

```graphql
mutation UpdateDeployment($input: UpdateDeploymentInput!) {
    updateDeployment(input: $input)
}
```

OPTIONS

```

```

### Example

```

```
