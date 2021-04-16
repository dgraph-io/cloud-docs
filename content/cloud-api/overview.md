+++
date = "2017-03-20T22:25:17+11:00"
title = "Overview"
weight = 1
[menu.main]
    parent = "cloud-api"
    identifier = "Overview"
+++

Dgraph Cloud now includes an API so you can programmatically launch and manage your Cloud backups.

The majority of these APIs use `https://cerebro.cloud.dgraph.io/graphql` as the primary endpoint, and will require you to log in with a username and password. Please see [Authentication]({{< relref "authentication.md" >}}) for instructions on generating a JWT token.

### Commands

Please see the following topics:

* [Authentication]({{< relref "authentication.md" >}}) describes how to authenticate with the Dgraph Cloud API.
* [Backend]({{< relref "backend.md" >}}) lists commands related to backend.
* [Backup]({{< relref "backup.md" >}}) lists commands related to backup.
* [Lambda]({{< relref "lambda.md" >}}) lists commands related to Lambda.
* [Schema]({{< relref "schema.md" >}}) lists commands related to schema.
