+++
title = "Authentication"
weight = 2   
[menu.main]
    parent = "slash-graphql-admin"
+++

Administrating your Dgraph Cloud with the [Slash CLI](slash-cli/overview/), using the `/query`, `/mutate`, `/commit`, `/admin`, `/admin/slash`, or `/alter` endpoints on Dgraph Cloud, and bypassing Anonymous Access restrictions on the `/graphql` endpoint requires an API key. A new API key can be generated from Slash GraphQL by selecting the ["Settings" button](https://cloud.dgraph.io/_/settings) from the sidebar, then clicking the Add API Key button. Keep your API key safe, it will not be accessible once you leave the page.

![Slash-GraphQL: Add an API Key ](/images/slash-graphql-4.png)

There are two types of API keys, client and admin.

- **Client API keys** can only be used to perform query, mutation and commit operations.
- **Admin API keys** can be used to perform both client operations and admin operations like drop data, destroy backend, update schema.

{{% notice "note" %}}
Either Client API keys or Admin API keys can be used to bypass [Anonymous Access](../settings) restrictions.
{{% /notice %}}

![Slash-GraphQL: Select API Key Role ](/images/slash-graphql-5.png)
<br>
<br>
All admin API requests must be authenticated by passing the API key as the 'Dg-Auth' header to every HTTP request. You can verify that your API key works by using the following HTTP example.

```
curl 'https://<your-backend>/admin' \
  -H 'Dg-Auth: <your-api-key>' \
  -H 'Content-Type: application/json' \
  --data-binary '{"query":"{ getGQLSchema { schema } }"}'
```
