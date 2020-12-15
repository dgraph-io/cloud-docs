+++
date = "2017-03-20T22:25:17+11:00"
title = "Overview"
weight = 1
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "Overview"
+++

*These are draft docs for Slash GraphQL, which is currently in beta*

Slash GraphQL now includes a CLI so you can manage it from the comfort of your command line!

Wherever possible, we have maintained compatibility with the corresponding Dgraph API, with the additional step of requiring authentication via the 'X-Auth-Token' header.

### Usage

```
$ npm install -g slash-graphql
$ slash-graphql COMMAND
running command...
$ slash-graphql (-v|--version|version)
slash-graphql/1.16.2 linux-x64 node-v10.19.0
$ slash-graphql --help [COMMAND]
USAGE
  $ slash-graphql COMMAND
...
```

### Commands

Please see the following topics:


* [Backend](/slash-cli/backend) lists commands related to backend.

* [Backup](/slash-cli/backup) lists commands related to backup.

* [Help](/slash-cli/help-update) lists commands to update `slash-graphql` CLI and help.

* [Lambda](/slash-cli/lambda) lists commands related to Lambda.

* [Login](/slash-cli/login) lists login and logout commands.

* [Schema](/slash-cli/schema) lists commands related to schema.
