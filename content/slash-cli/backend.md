+++
title = "Backend"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "backend"
+++

### Deploy Backend

Launch a new backend.

USAGE
```
  $ slash-graphql deploy-backend NAME
```

ARGUMENTS
```
  NAME  Backend Name
```

OPTIONS
```
  -m, --deployment-mode=readonly|graphql|flexible  [default: graphql] Deployment Mode
  -q, --quiet                                      Quiet Output
  -r, --region=region                              [default: us-west-2] Region
  -s, --subdomain=subdomain                        Subdomain
```

ALIASES
```
  $ slash-graphql create-backend
  $ slash-graphql launch-backend
```

EXAMPLE
```
  $ slash-graphql deploy-backend "My New Backend"
```

### List Backends

List your backends.

USAGE
```
  $ slash-graphql list-backends
```

OPTIONS
```
  -q, --quiet             Quiet output
  -x, --extended          show extra columns
  --columns=columns       only show provided columns (comma-separated)
  --csv                   output is csv format [alias: --output=csv]
  --filter=filter         filter property by partial string matching, ex: name=foo
  --no-header             hide table header from output
  --no-truncate           do not truncate output to fit screen
  --output=csv|json|yaml  output in a more machine friendly format
  --sort=sort             property to sort by (prepend '-' for descending)
```

EXAMPLES
```
  $ slash-graphql list-backends
  $ slash-graphql list-backends --csv
```

### Update Backend

Update backend.

USAGE
```
  $ slash-graphql update-backend ID
```

ARGUMENTS
```
  ID  Backend UID
```

OPTIONS
```
  -m, --deployment-mode=readonly|graphql|flexible  Deployment mode
  -n, --name=name                                  Name
  -q, --quiet                                      Quiet output
  -y, --confirm                                    Skip confirmation
```

EXAMPLE
```
  $ slash-graphql update-backend -n "New Name" 0xid
```

### Export Data

Export data from your backend.

USAGE
```
  $ slash-graphql export-data OUTPUTDIR
```

ARGUMENTS
```
  OUTPUTDIR  Output directory
```

OPTIONS
```
  -e, --endpoint=endpoint  Slash GraphQL endpoint
  -q, --quiet              Quiet output
  -t, --token=token        Slash GraphQL backend API tokens
```

EXAMPLE
```
  $ slash-graphql export-data -e https://frozen-mango.cloud.dgraph.io/graphql -t <apiToken> ./output-directory
```

### Import Data

Import your data back using Dgraph Live Loader (requires docker).

USAGE
```
  $ slash-graphql import-data INPUT
```

ARGUMENTS
```
  INPUT  Input directory
```

OPTIONS
```
  -e, --endpoint=endpoint  Slash GraphQL endpoint
  -q, --quiet              Quiet output
  -t, --token=token        Slash GraphQL backend API tokens
  -y, --confirm            Skip confirmation
```

EXAMPLE
```
  $ slash-graphql import-data -e https://frozen-mango.cloud.dgraph.io/graphql -t <apiToken> ./import-directory
```

### Destroy Backend

Destroy (i.e., delete) a backend by id.

USAGE
```
  $ slash-graphql destroy-backend ID
```

ARGUMENTS
```
  ID  Backend id
```

OPTIONS
```
  -q, --quiet    Quiet output
  -y, --confirm  Skip confirmation
```

EXAMPLE
```
  $ slash-graphql destroy-backend "0xid"
```

### Restore Backends

Restore into a backend by source backend ID.

USAGE
```
  $ slash-graphql restore-backend
```

OPTIONS
```
  -e, --endpoint=endpoint          Slash GraphQL endpoint
  -f, --backupFolder=backupFolder  Backup folder retrieved from list-backups. Defaults to ""(latest).
  -n, --backupNum=backupNum        Backup number retrieved from list-backups. Defaults to 0(latest).
  -q, --quiet                      Quiet output
  -s, --source=source              (required) Source backend ID or url to get the data to be restored
  -t, --token=token                Slash GraphQL backend API tokens
  -y, --confirm                    Skip confirmation
```

EXAMPLE
```
  $ slash-graphql restore-backend -e https://clone.cloud.dgraph.io/graphql -t <apiToken> --source <source backend id or 
  url> [-f <backup folder> -n <backup number>]
```

### Restore Backend Status

Retrieve the status of a restore operation.

USAGE
```
  $ slash-graphql restore-backend-status RESTOREID
```

ARGUMENTS
```
  RESTOREID  Restore ID
```

OPTIONS
```
  -e, --endpoint=endpoint  Slash GraphQL endpoint
  -q, --quiet              Quiet output
  -t, --token=token        Slash GraphQL backend API tokens
```

EXAMPLE
```
  $ slash-graphql restore-backend-status -e https://clone.cloud.dgraph.io/graphql -t <apiToken> "restoreID"
```

### Drop

Drop (i.e., delete) all data in your backend.

USAGE
```
  $ slash-graphql drop
```

OPTIONS
```
  -F, --drop-fields=drop-fields  Drop types
  -T, --drop-types=drop-types    Drop types
  -d, --drop-data                Drop data and leave the schema
  -e, --endpoint=endpoint        Slash GraphQL endpoint
  -l, --list-unused              List unused types and fields
  -q, --quiet                    Quiet output
  -s, --drop-schema              Drop schema along with the data
  -t, --token=token              Slash GraphQL backend API tokens
  -u, --drop-unused              Drops all unused types and fields
  -y, --confirm                  Skip confirmation
```

EXAMPLE
```
  $ slash-graphql drop -e https://frozen-mango.cloud.dgraph.io/graphql -t <apiToken> [-l] [-d] [-s] [-T <types>] [-F 
  <fields>]
```
