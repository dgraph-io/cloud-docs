+++
title = "Restore Backends"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "restore-backends"
+++

Restore into a backend by source backend ID.

USAGE
```
  $ slash-graphql restore-backend
```

OPTIONS
```
  -e, --endpoint=endpoint          Slash GraphQL Endpoint
  -f, --backupFolder=backupFolder  Backup folder retrieved from list-backups. Defaults to ""(latest).
  -n, --backupNum=backupNum        Backup number retrieved from list-backups. Defaults to 0(latest).
  -q, --quiet                      Quiet Output
  -s, --source=source              (required) Source backend ID or url to get the data to be restored
  -t, --token=token                Slash GraphQL Backend API Tokens
  -y, --confirm                    Skip Confirmation
```

EXAMPLE
```
  $ slash-graphql restore-backend -e https://clone.cloud.dgraph.io/graphql -t <apiToken> --source <source backend id or 
  url> [-f <backup folder> -n <backup number>]
```
