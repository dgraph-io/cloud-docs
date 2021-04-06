+++
title = "Migrating from Self-Managed Dgraph"
weight = 7
[menu.main]
    parent = "slash-graphql"
+++

Dgraph Cloud is compatible with the majority of Dgraph features, so you can easily
migrate your existing Dgraph-powered app over to Dgraph Cloud.

### To migrate data from self-managed Dgraph to Dgraph Cloud

1. Create a new backend. You can do this using the Dgraph Cloud interface, or by using the [Dgraph Cloud command-line tool](https://www.npmjs.com/package/slash-graphql).
2. (optional) Switch your backend to [DQL+GraphQL mode](/admin/backend-modes#dql+graphql-mode).
3. Connect to your backend with your favorite client. To learn more, see [Connecting from Dgraph Clients](/advanced-queries#connecting-from-dgraph-clients).
