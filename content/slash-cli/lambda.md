+++
title = "Lambda"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "lambda"
+++

### Get Lambda Script

Get the Lambda script associated with the backend.

USAGE
```
  $ slash-graphql get-lambda
```

OPTIONS
```
  -e, --endpoint=endpoint  Dgraph Cloud endpoint
  -q, --quiet              Quiet output
  -t, --token=token        Dgraph Cloud backend API tokens
```

EXAMPLES
```
  $ slash-graphql get-lambda -e https://frozen-mango.cloud.dgraph.io/graphql
  $ slash-graphql get-lambda -e 0x1234
```

### Lambda Logs

Get the Lambda logs associated with the backend.

USAGE
```
  $ slash-graphql lambda-logs
```

OPTIONS
```
  -e, --endpoint=endpoint  Dgraph Cloud endpoint
  -h, --hours=hours        [default: 1] Show lambda logs for last given hours. Defaults to 1 hour.
  -q, --quiet              Quiet output
  -t, --token=token        Dgraph Cloud backend API tokens
```

EXAMPLES
```
  $ slash-graphql lambda-logs -e https://frozen-mango.cloud.dgraph.io/graphql
  $ slash-graphql lambda-logs -e 0x1234 -h 5
```

### Update Lambda

Get the Lambda script associated with the backend.

USAGE
```
  $ slash-graphql update-lambda
```

OPTIONS
```
  -e, --endpoint=endpoint  Dgraph Cloud endpoint
  -f, --file=file          (required) Lambda script file path.
  -q, --quiet              Quiet output
  -t, --token=token        Dgraph Cloud backend API tokens
```

EXAMPLES
```
  $ slash-graphql update-lambda -e https://frozen-mango.cloud.dgraph.io/graphql -f <filepath>
  $ slash-graphql update-lambda -e 0x1234 -f /home/user/Downloads/script.js
```

### Delete Lambda

Delete the Lambda script associated with the backend.

USAGE
```
  $ slash-graphql delete-lambda
```
OPTIONS
```
  -e, --endpoint=endpoint  Dgraph Cloud endpoint
  -q, --quiet              Quiet output
  -t, --token=token        Dgraph Cloud backend API tokens
  -y, --confirm            Skip confirmation
```
EXAMPLES
```
  $ slash-graphql delete-lambda -e https://frozen-mango.cloud.dgraph.io/graphql
  $ slash-graphql delete-lambda -e 0x1234
```
