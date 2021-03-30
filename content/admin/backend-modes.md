+++
title = "Switching Backend Modes"
weight = 6
[menu.main]
    parent = "slash-graphql-admin"
+++

Dgraph Cloud supports three different backend modes, which control how the
underlying Dgraph instance is configured. Each mode is pre-configured keeping ease of use in mind:
- [Read-Only mode](#read-only-mode), for use cases involving queries to a read-only dataset.
- [GraphQL mode](#graphql-mode), suited for use cases centered around schemas and queries based on GraphQL.
- [Flexible mode](#flexible-mode) supports both GraphQL and DQL, and is often preferred by users who are familiar with DQL.

{{% notice "tip" %}}
By default, your Dgraph Cloud backend will run in [GraphQL mode](#graphql-mode).
If you want to have the same behavior as a local Dgraph instance, change your backend to [Flexible mode](#flexible-mode). 
{{% /notice %}}

### Read-only Mode

In read-only (`readonly`) mode, only queries are allowed. All mutations and 
attempts to alter the schema are disallowed.

### GraphQL Mode

GraphQL mode is the default setting on Dgraph Cloud, and is suitable for
backends where the primary mode of interaction is using the GraphQL APIs. You
can use DQL (formerly *GraphQL+-*) queries and mutations in this mode, as
described in the [advanced queries](/advanced-queries/) section. However, all
queries and mutations must be valid for the applied GraphQL schema.

{{% notice "note" %}}
In GraphQL mode, Dgraph Cloud will enforce a [strict schema](https://dgraph.io/docs/deploy/dgraph-administration/#restricting-mutation-operations), allowing mutations only on predicates already present in the schema.
Before executing a mutation on a predicate that doesn’t exist in the schema, you need to perform an `alter` operation with that predicate and its schema type.
{{% /notice %}}

### Flexible Mode

Flexible mode is suitable for users who are already familiar with Dgraph, and
plan to interact with their backend using DQL. Flexible mode removes any
restrictions on queries and mutations, and also provides users access to
advanced Dgraph features like directly altering the schema with the `/alter`
HTTP and GRPC endpoints.

Running your backend in flexible mode is also a requirement for upcoming
features such as support for Dgraph's access control list (ACL).

## Changing your Backend Mode

To change your backend mode, go to the 
[settings page](https://cloud.dgraph.io/_/settings), click the <kbd>Advanced</kbd> tab,
and then select a mode from the **Backend Mode** list box.
