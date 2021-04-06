+++
title = "Switching Schema Modes"
weight = 6
[menu.main]
    parent = "slash-graphql-admin"
+++

Dgraph Cloud supports three different schema modes, which control how the
underlying Dgraph instance is configured. Each mode is pre-configured keeping ease of use in mind:

- [Read-Only mode](#read-only-mode), where no schema changes or mutations are allowed.
- [Strict mode](#strict-mode), only allowing mutations on predicates that are already present in the schema.
- [Flexible mode](#flexible-mode) removes any restriction on schemas and mutations, and provides access to advanced Dgraph features.

{{% notice "tip" %}}
By default, your Dgraph Cloud schema will run in [Strict mode](#strict-mode).
If you want to have the same behavior as a local Dgraph instance, change your schema to [Flexible mode](#flexible-mode). 
{{% /notice %}}

## Read-only Mode

In read-only mode, all mutations and attempts to alter the Cloud schema are blocked.
You can still access your data through read-only queries.

## Strict Mode

Strict mode is the default setting on Dgraph Cloud.
In this mode, Dgraph Cloud will enforce a [strict schema](https://dgraph.io/docs/deploy/dgraph-administration/#restricting-mutation-operations), only allowing mutations on predicates already present in the schema.

You can use GraphQL and DQL (formerly *GraphQL+-*) queries and mutations in this mode, as
described in the [advanced queries](/advanced-queries/) section. However, all
queries and mutations must be valid for the applied schema.

{{% notice "note" %}}
In **Strict mode**, before executing a mutation on a predicate that doesn’t exist in the schema, you need to perform an `alter` operation with that predicate and its schema type.
{{% /notice %}}

## Flexible Mode

Flexible mode is suitable for users who are already familiar with Dgraph. Flexible mode removes any
restrictions on schemas and mutations, and also provides access to
advanced Dgraph features like directly altering the schema with the `/alter`
HTTP and GRPC endpoints.

Running your backend in flexible mode is also a requirement for upcoming
features such as support for access control lists (ACL).

## Changing your Schema Mode

To change your schema mode, go to the 
[settings page](https://cloud.dgraph.io/_/settings), click the <kbd>Advanced</kbd> tab,
and then select a mode from the **Schema Mode** list box.
