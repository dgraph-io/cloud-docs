+++
title = "Lambda"
weight = 3
[menu.main]
    parent = "cloud-api"
    identifier = "lambda"
+++

## Get Lambda Script

Get the Lambda script associated with the backend.

### Cloud Endpoint

```
https://cerebro.cloud.dgraph.io/graphql
```

### API Command

1. [List Backends](/backend/#list-backends)
2. Decode the base64 encoded `deployment.lambdaScript` value

### Example

#### 1. List Backends

**Request**

See [List Backends](/backend/#list-backends).

**Response**

```json
{
  "data": {
    "deployments": [
      {
      "deploymentMode": "graphql",
      "deploymentType": "free",
      "jwtToken": "<deployment-jwt>",
      "lambdaScript": "Ly8gWW91IGNhbiB0eXBlL3Bhc3RlIHlvdXIgc2NyaXB0IGhlcmUKY29uc3QgTmFtZVJlc29sdmVyID0gKHtwYXJlbnQ6IHtuYW1lfX0pID0+IGBNeSBuYW1lIGlzICR7bmFtZX0uYAoKc2VsZi5hZGRHcmFwaFFMUmVzb2x2ZXJzKHsKICAgICJQZXJzb24ubmFtZSI6IE5hbWVSZXNvbHZlcgp9KQ==",
      "name": "My Deployment!",
      "owner": "486c69b4-e09b-48f9-a28a-86314fe232cd",
      "uid": "0xf0ffe9",
      "url": "polished-violet.us-east-1.aws.stage.thegaas.com",
      "zone": "us-east-1"
      }
    ]
  }
}
```

#### 2. Decode `deployment.lambdaScript`

```console
user@host:~$ echo "Ly8gWW91IGNhbiB0eXBlL3Bhc3RlIHlvdXIgc2NyaXB0IGhlcmUKY29uc3QgTmFtZVJlc29sdmVyID0gKHtwYXJlbnQ6IHtuYW1lfX0pID0+IGBNeSBuYW1lIGlzICR7bmFtZX0uYAoKc2VsZi5hZGRHcmFwaFFMUmVzb2x2ZXJzKHsKICAgICJQZXJzb24ubmFtZSI6IE5hbWVSZXNvbHZlcgp9KQ==" | base64 -d

const NameResolver = ({parent: {name}}) => `My name is ${name}.`

self.addGraphQLResolvers({
  "Person.name": NameResolver
})
```

## Lambda Logs

Get the Lambda logs associated with the backend.

### Cloud Endpoint

```
https://cerebro.cloud.dgraph.io/graphql
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
https://cerebro.cloud.dgraph.io/graphql
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
https://cerebro.cloud.dgraph.io/graphql
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
