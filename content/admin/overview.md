+++
date = "2017-03-20T22:25:17+11:00"
title = "Overview"
weight = 1   
[menu.main]
    parent = "cloud-admin"
    name = "Overview"
    identifier = "cloud-overview"
+++

Here is a guide to programmatically administering your Dgraph Cloud backend.

Wherever possible, we have maintained compatibility with the corresponding Dgraph API, with the additional step of requiring authentication via the 'X-Auth-Token' header.

Please see the following topics:

* [Authentication](/admin/authentication) will guide you in creating a API token. Since all admin APIs require an auth token, this is a good place to start.
* [Schema](/admin/schema) describes how to programmatically query and update your GraphQL schema.
* [Import and Exporting Data](/admin/import-export) is a guide for exporting your data from a Dgraph Cloud backend, and how to import it into another cluster
* [Dropping Data](/admin/drop-data) will guide you through dropping all data from your Dgraph Cloud backend.
