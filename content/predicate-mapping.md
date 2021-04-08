+++
title = "Dgraph Predicate Mapping"
weight = 13
[menu.main]
  identifier = "predicate-mapping"
  parent = "cloud"
+++

Dgraph allows type and edge names that aren't valid in GraphQL, so, often, you'll need to expose valid GraphQL names. Dgraph admits special characters and even different languages ([see here](https://dgraph.io/docs/query-language/#predicate-name-rules)), while the GraphQL Spec requires that type and field (predicate) names are generated from `/[_A-Za-z][_0-9A-Za-z]*/`.

## Mapping GraphQL to a Dgraph schema

By default, Dgraph generates a new predicate for each field in a GraphQL type. The name of the generated predicate is composed of the type name followed by a dot `.` and ending with the field name. Therefore, two different types with fields of the same name will turn out to be different Dgraph predicates and can have different indexes.

For example, the following types:

```graphql
interface Human {
   age: Int
}

type Person implements Human {
    name: String @search(by: [hash])
}

type Movie {
    name: String @search(by: [term])
}
```

generate a Dgraph schema like:

```graphql
Human.age: int .
Movie.name: string @index(term) .
Person.name: string @index(hash) .

type Human {
	Human.age
}

type Movie {
	Movie.name
}

type <Person> {
	Human.age
	Person.name
}
```

This behavior can be customized with the `@dgraph` directive.  

* `type T @dgraph(type: "DgraphType")` controls what Dgraph type is used for a GraphQL type.
* `field: SomeType @dgraph(pred: "DgraphPredicate")` controls what Dgraph predicate is mapped to a GraphQL field.

{{% notice "tip" %}}
You can find additional mapping examples in the [GraphQL on Existing Dgraph](/docs/graphql/dgraph/#mapping-graphql-to-a-dgraph-schema) article.
{{% /notice %}}
