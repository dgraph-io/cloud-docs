+++
title = "Importing and Exporting data from Dgraph Cloud"
weight = 4   
[menu.main]
    parent = "cloud-admin"
+++

You can export your data from one Dgraph Cloud backend, and then import this data back into another Dgraph instance or Dgraph Cloud Backend.

## Exporting Data

You can export your data using JSON format. To do this, call the `export` mutation on `/admin/slash`. As an example, if your GraphQL endpoint is at `https://frozen-mango.us-west-2.aws.cloud.dgraph.io/graphql`, then the `/admin` endpoint for the schema is at `https://frozen-mango.us-west-2.aws.cloud.dgraph.io/admin/slash`.

{{% notice "note" %}}
The `/admin/slash` endpoint requires [Authentication](/admin/authentication).
{{% /notice %}}

The following is an example of a GraphQL mutation to export data to JSON.

```graphql
mutation {
  export {
    response { code message }
    signedUrls
  }
}
```

The `signedUrls` output field contains a list of URLs which can be downloaded. These URLs expire after 48 hours.

Export will usually return 3 files:
* `g01.gql_schema.gz`: The GraphQL schema file. This file can be re-imported via the [Schema APIs](/admin/schema)
* `g01.json.gz`: the data from your instance, which can be imported via live loader
* `g01.schema.gz`: This file is the internal Dgraph schema. If you have set up your backend with a GraphQL schema, then you should be able to ignore this file.

## Importing data with Live Loader

It is possible to import data into a Dgraph Cloud backend using [live loader](https://dgraph.io/docs/deploy/#live-loader). In order to import data, do the following steps:

1. First import your schema into your Dgraph Cloud backend, using either the [Schema API](/admin/schema) or via [the Schema Page](https://cloud.dgraph.io/_/schema).
2. Find the gRPC endpoint for your cluster, as described in the [advanced queries](/advanced-queries) section. This will look like `frozen-mango.grpc.us-west-1.aws.cloud.dgraph.io:443`

{{% notice "note" %}}
The gRPC endpoint URL must have the string `.grpc.` added after the domain prefix. Without this change, Live Loader will not be able to find the endpoint.
{{% /notice %}}

3. Run the live loader as follows:

    ```
    docker run -it --rm -v /path/to/g01.json.gz:/tmp/g01.json.gz dgraph/dgraph:v20.07-slash \
      dgraph live --slash_grpc_endpoint=<grpc-endpoint>:443 -f /tmp/g01.json.gz -t <api-token>
    ```

{{% notice "note" %}}
Running this via Docker requires you to use an unreleased tag (either `master` or `v20.11-slash`).
{{% /notice %}}
