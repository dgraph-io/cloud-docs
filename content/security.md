+++
title = "Securing Your GraphQL endpoint"
weight = 6
[menu.main]
    parent = "slash-graphql"
+++

Here are a few tips for securing your Slash GraphQL Backend

### Allowing Access to your GraphQL Endpoint

Dgraph Cloud allows you to choose which GraphQL operations are available to end users.

You can visit the [access tab on the schema page](https://cloud.dgraph.io/_/schema) and choose the operations that you want to allow/deny for anonymous users.

Please note that Anonymous Access should not be confused with the Dgraph Auth and it sits one level above the Dgraph Auth. So, when you fully block anonymous access to your backend from the schema page, none of your GraphQL requests will go through to Dgraph database and are rejected by the GraphQL Auth layer itself.

The API Keys that you generate on the [settings page](https://cloud.dgraph.io/_/settings) will have full access to all the GraphQL operations. In case you need full access to all the operations, we encourage you to pass the API key in the `DG-Auth` header while sending your requests to the `/graphql` endpoint of your backend.

By default all operations are accessible to anonymous users. However, this behaviour will change in the near future and old backends will remain unaffected.

### Writing Auth Rules

All GraphQL queries and mutations are unrestricted by default. In order to restrict access, please see the [the @auth directive](https://dgraph.io/docs/graphql/authorization/directive/).

### Restricting CORS from allowlisted domains

Restricting the origins that your Slash GraphQL responds to is a an important step in preventing XSS exploits. Your Slash GraphQL backend will prevent any origins that are not in the allowlist from accessing your GraphQL endpoint.

In order to add origins to the allow list, please see the [settings page](https://cloud.dgraph.io/_/settings), under the **CORS** tab. By default, we allow all origins to connect to your endpoint (`Access-Control-Allow-Origin: *`), and adding an origin will prevent this default behavior. On adding your first origin, we automatically add `https://cloud.dgraph.io`  as well, so that the API explorer continues to work.

{{% notice "note" %}}
CORS restrictions are not a replacement for writing auth rules, as it is possible for malicious actors to bypass these restrictions.
Also, note that CORS restrictions only apply to browsers, so you should never use CORS as a way to secure your system (CORS can only protect user data).
{{% /notice %}}
