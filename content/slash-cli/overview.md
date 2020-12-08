+++
date = "2017-03-20T22:25:17+11:00"
title = "Overview"
weight = 1
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "Overview"
+++

*These are draft docs for Slash GraphQL, which is currently in beta*

Manage Slash GraphQL from the comfort of your command line!

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

* [Delete Lambda](/slash-cli/delete-lambda) Delete the Lambda script associated with the backend.

* [Deploy Backend](/slash-cli/deploy-backend) Launch a new Backend.

* [Destroy Backend](/slash-cli/destroy-backend) Destroy a Backend by id.

* [Drop](/slash-cli/drop) Drop all data in your backend.

* [Export Data](/slash-cli/export-data) Export data from your backend.

* [Get Lambda](/slash-cli/get-lambda) Get the Lambda script associated with the backend.

* [Get Schema](/slash-cli/get-schema) Fetch the schema from your backend.

* [Help](/slash-cli/help) Display help for slash-graphql.

* [Import Data](/slash-cli/import-data) Import your data back via live loader (requires docker).

* [Lambda Logs](/slash-cli/lambda-logs) Get the Lambda script associated with the backend.

* [List Backends](/slash-cli/list-backends) List your backends.

* [Login](/slash-cli/login) Login to Slash GraphQL. Calling this function will keep you logged in for 24 hours, and you will not need to pass access tokens for any backends that you own.

* [Logout](/slash-cli/logout) Logout of Slash GraphQL Command Line.

* [Restore Backend](/slash-cli/restore-backend) Restore into a backend by source backend ID.

* [Restore Backend Status](/slash-cli/restore-backend-status) Retrieve the status of a restore operation.

* [Update](/slash-cli/update) Update the slash-graphql CLI.

* [Update Backend](/slash-cli/update-backend) Update Backend.

* [Update Lambda](/slash-cli/update-lambda) Get the Lambda script associated with the backend.

* [Update Schema](/slash-cli/update-schema) Update the schema in your backend.

