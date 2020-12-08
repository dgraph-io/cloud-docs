+++
title = "Update Backend"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "update-backend"
+++

Update Backend.

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
  -m, --deployment-mode=readonly|graphql|flexible  Deployment Mode
  -n, --name=name                                  Name
  -q, --quiet                                      Quiet Output
  -y, --confirm                                    Skip Confirmation
```

EXAMPLE
```
  $ slash-graphql update-backend -n "New Name" 0xid
```
