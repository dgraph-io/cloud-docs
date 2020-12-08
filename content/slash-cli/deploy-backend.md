+++
title = "Deploy Backend"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "deploy-backend"
+++

Launch a new Backend.

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
