+++
title = "Switching Backend Modes"
weight = 6
[menu.main]
    parent = "slash-graphql-admin"
+++

Slash GraphQL supports different 3 different backend modes, which controls how the underlying Dgraph instance is configured

### Readonly Mode

In readonly mode, only queries are allowed. All mutations and attempts to alter schema are disallowed.

### GraphQL Mode

GraphQL mode is the default setting on Slash GraphQL, and is suitable for
backends where the primary mode of interaction is using the GraphQL APIs. You
can use DQL (formerly *GraphQL+-*) queries and mutations, as described in
the [advanced queries](/advanced-queries/) section. However, all queries and
mutations must be valid for the applied GraphQL schema.

### Flexible Mode

Flexible mode is suitable for users who are already familiar with Dgraph, and
intend to interact with their backend using DQL. Flexible mode removes any
restrictions on queries and mutations, and also provides users access to
advanced Dgraph features like directly altering the schema with the `/alter`
HTTP and GRPC endpoints.

Running your backend in flexible mode is also a requirement for upcoming
features such as support for Dgraphs access control list (ACL).

## Changing your Backend Mode

To change your backend mode, go to the 
[settings page](https://slash.dgraph.io/_/settings), click the "Advanced" tab,
and select a mode from the **Backend Mode** list box.
