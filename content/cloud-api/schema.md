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

```


### Example

```

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
