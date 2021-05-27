+++
title = "Switching Schema Modes"
weight = 6
[menu.main]
    parent = "cloud-admin"
+++

Dgraph Cloud uses the following three schema modes, which control how the
underlying Dgraph instance is configured:

- [Read-Only mode](#read-only-mode) (*dedicated instances only*): In this mode, no
  schema changes or mutations are allowed
- [Strict mode](#strict-mode): In this mode, only mutations on predicates that
  are already present in the schema are allowed
- [Flexible mode](#flexible-mode) (*dedicated instances only*): In this mode,
  there are no global restrictions on schemas and mutations; this mode also
  provides access to advanced Dgraph features

Each mode is pre-configured to provide simplicity and ease-of-use. By default,
your Dgraph Cloud schema will run in [Strict mode](#strict-mode). If you want 
your dedicated instance to have the same behavior as a local Dgraph instance,
change your schema to [Flexible mode](#flexible-mode). 

## Read-only Mode

In read-only mode, all mutations and attempts to alter the Cloud schema are
blocked. You can still access your data through read-only queries.

## Strict Mode

Strict mode is the default mode on Dgraph Cloud, and the only mode available for
free and shared instances. In this mode, Dgraph Cloud enforces a [strict schema](https://dgraph.io/docs/deploy/dgraph-administration/#restricting-mutation-operations), only allowing mutations on
predicates already present in the schema.

You can use GraphQL and DQL (formerly *GraphQL+-*) queries and mutations in this
mode, as described in the [advanced queries](/advanced-queries/) section.
However, all queries and mutations must be valid for the applied schema.

{{% notice "note" %}}
In **Strict mode**, before executing a mutation on a predicate that doesn’t
exist in the schema, you need to perform an `alter` operation with that
predicate and its schema type.
{{% /notice %}}

## Flexible Mode

Flexible mode is suitable for users who are already familiar with Dgraph.
Flexible mode removes any restrictions on schemas and mutations, and also
provides access to advanced Dgraph features like the following:

* Directly altering the schema with the `/alter` HTTP and GRPC endpoints
* Support for access control lists (ACLs)

## Changing your Schema Mode

To change your schema mode on a dedicated instance, go to the [settings page](https://cloud.dgraph.io/_/settings),
click the <kbd>General</kbd> tab, and then select a mode from the
**Schema Mode** list box.

### Changing your Schema Mode with the `/admin` endpoint

{{% notice "tip" %}}
Dgraph Labs recommends using the Dgraph Cloud [settings page](https://cloud.dgraph.io/_/settings)
to change your dedicated instance's schema mode for most scenarios, instead of
directly modifying your schema.
{{% /notice %}}

You can change the schema mode for your dedicated instance directly in the schema
using the `updateGQLSchema` mutation on the `/admin` HTTP and GRPC endpoints. To
learn more, see [Fetching and Updating your Schema]({{< relref "admin/schema" >}})

To set your schema mode, configure `UpdateOption` to use one of the following
values in your schema:

* To use Read Only mode, set `UpdateOption` to `readonly`
* To use Strict mode, set `UpdateOption` to `graphql`
* To use Flexible mode, set `UpdateOption` to `flexible`
