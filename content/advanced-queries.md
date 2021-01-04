+++
title = "Advanced Queries with DQL"
weight = 2
[menu.main]
    parent = "slash-graphql"
+++

*You can now [embed DQL queries inside your GraphQL schema](https://dgraph.io/docs/graphql/custom/graphqlpm), which is recommended for most use cases. The rest of this document covers how to connect to your Slash GraphQL backend with existing Dgraph clients.*

Slash GraphQL also supports running advanced queries using Dgraph Query Language (DQL) (previously named GraphQL+-).
DQL is based on GraphQL, but adds and removes features to better support graph
database operations.
Advanced users can use DQL to make queries and mutations using existing Dgraph
client libraries, using either the the HTTP or gRPC endpoints.
To learn more about Dgraph's client libraries, see our 
[client library documentation](https://dgraph.io/docs/clients/). To learn more
about DQL, see [DQL Fundamentals](https://dgraph.io/docs/query-language/graphql-fundamentals/)..

If you are getting started with Slash GraphQL, you should probably start out by
using Dgraph's [GraphQL API](https://dgraph.io/docs/graphql/overview) instead.
Dgraph GraphQL API lets you quickly started using Slash GraphQL before you
use the advanced features available using DQL.

Please note that Slash GraphQL does not allow you to alter the schema or create 
new predicates using DQL. You also can't access the `/alter`
endpoint or it's gRPC equivalent. Please add your schema through the GraphQL
endpoint (using either the UI or the Admin API), before accessing your data with 
DQL.

## Authentication

All the APIs documented here require an API token for access. Please see
[Authentication](/admin/authentication) if you would like to create a new API token.

### HTTP

You can query your backend with DQL using your cluster's `/query` endpoint. As
an example, if your GraphQL endpoint is `https://frozen-mango-42.us-west-2.aws.cloud.dgraph.io/graphql`,
then the admin endpoint for the schema is at `https://frozen-mango.us-west-2.aws.cloud.dgraph.io/query`.

This endpoint works identically to Dgraph's [/query](https://dgraph.io/docs/query-language/)
endpoint, with the additional constraint of requiring authentication, as 
described in the Authentication section above.

You may also access the [`/mutate`](https://dgraph.io/docs/mutations/) and
`/commit` endpoints.

For example, let's say you have the following GraphQL schema:
```graphql
type Person {
 name: String! @search(by: [fulltext])
 age: Int
 country: String
}
```
Here is an example of a cURL command with the `/mutate` endpoint:
```
curl -H "Content-Type: application/rdf" -H "x-auth-token: <api-key>" -X POST "<graphql-endpoint>/mutate?commitNow=true" -d $'
{
 set {
    _:x <Person.name> "John" .
    _:x <Person.age> "30" .
    _:x <Person.country> "US" .
 }
}'
```

And here is an example of a cURL command with the `/query` endpoint:
```
curl -H "Content-Type: application/dql" -H "x-auth-token: <api-key>" -XPOST "<graphql-endpoint>/query" -d '{
   queryPerson(func: type(Person))  {
     Person.name
     Person.age
     Person.country
  }
}'
```

### gRPC

Slash GraphQL is compatible with most existing Dgraph clients. You can use the
helper methods from each library to connect to your backend, passing in a Slash
GraphQL endpoint and API token.

Here is an example which uses the [pydgraph client](https://github.com/dgraph-io/pydgraph) to make gRPC requests.

```python
import pydgraph

client_stub = pydgraph.DgraphClientStub.from_slash_endpoint("https://frozen-mango-42.eu-central-1.aws.cloud.dgraph.io/graphql", "<api-key>")
client = pydgraph.DgraphClient(client_stub)
```

For mutations, you can use the following example:
```python
mut = {
  "Person.name": "John Doe",
  "Person.age": "32",
  "Person.country": "US"
}

txn = client.txn()
try:
  res = txn.mutate(set_obj=mut)
finally:
  txn.discard()
```

And for a query you can use the following example:
```python
query = """
{
   queryPerson(func: type(Person))  {
     Person.name
     Person.age
     Person.country
  }
}"""
txn = client.txn()
try:
  res = txn.query(query)
  ppl = json.loads(res.json)
  print(ppl)
finally:
  txn.discard()
```

#### Connecting from Dgraph Clients

Below are snippets to connect to your Slash Backend from various dgraph clients.

**Python**
```python
import pydgraph

client_stub = pydgraph.DgraphClientStub.from_slash_endpoint("https://frozen-mango-42.eu-central-1.aws.cloud.dgraph.io/graphql", "<api-key>")
client = pydgraph.DgraphClient(client_stub)
```

**Javascript**
```javascript
const dgraph = require("dgraph-js");

const clientStub = dgraph.clientStubFromSlashGraphQLEndpoint(
  "https://frozen-mango-42.eu-central-1.aws.cloud.dgraph.io/graphql",
  "<api-key>"
);
const dgraphClient = new dgraph.DgraphClient(clientStub);
```

**Go**
```golang
// This example uses dgo
conn, err := dgo.DialSlashEndpoint("https://frozen-mango-42.eu-central-1.aws.cloud.dgraph.io/graphql", "<api-key>")
if err != nil {
  log.Fatal(err)
}
defer conn.Close()
dgraphClient := dgo.NewDgraphClient(api.NewDgraphClient(conn))
```

**Java**
```java
// This example uses dgraph4j
DgraphStub stub = DgraphClient.clientStubFromSlashEndpoint("https://frozen-mango-42.eu-central-1.aws.cloud.dgraph.io/graphql", "<api-key>");
DgraphClient dgraphClient = new DgraphClient(stub);
```

### Visualizing your Graph with Ratel

You can use Ratel to visualize your Slash GraphQL backend with DQL. You can host
Ratel yourself, or you can use Ratel online at [Dgraph Play](https://play.dgraph.io/?latest#connection)

To configure Ratel:

1. Click the Dgraph logo in the top left to bring up the connection screen (by default, it has the caption: play.dgraph.io)
2. Enter your backend's host in the Dgraph Server URL field. This is obtained by removing `/graphql` from the end of your `/graphql` endpoint URL. As an example, if your `/graphql` endpoint is `https://frozen-mango-42.us-west-2.aws.cloud.dgraph.io/graphql`, then the host for Ratel is located at `https://frozen-mango.us-west-2.aws.cloud.dgraph.io`
3. Click the blue 'Connect' button. You should see a green tick check next to the word connected
4. Click on the 'Extra Settings' tab, and enter your API token into the 'Slash API Key" field. Please see [Authentication](/admin/authentication) if you would like to create a new API token.
5. Click on the blue 'Continue' button.

You can now run queries and mutations using Ratel, and see visualizations of your data.

Ratel has certain limitations; it doesn't support backups, modifying ACL or
attempting to remove nodes from the cluster.

### Switching Backend Modes

If you want to use DQL as your primary mode of interaction with the Slash GraphQL
backend (as opposed to primarily using the Dgraph GraphQL API), you can switch your
backend to flexible mode. To learn more, see [Backend Modes](/admin/backend-modes).
