+++
title = "List Backends"
weight = 2
[menu.main]
    parent = "slash-graphql-cli"
    identifier = "list-backends"
+++

List your backends.

USAGE
```
  $ slash-graphql list-backends
```

OPTIONS
```
  -q, --quiet             Quiet Output
  -x, --extended          show extra columns
  --columns=columns       only show provided columns (comma-separated)
  --csv                   output is csv format [alias: --output=csv]
  --filter=filter         filter property by partial string matching, ex: name=foo
  --no-header             hide table header from output
  --no-truncate           do not truncate output to fit screen
  --output=csv|json|yaml  output in a more machine friendly format
  --sort=sort             property to sort by (prepend '-' for descending)
```

EXAMPLES
```
  $ slash-graphql list-backends
  $ slash-graphql list-backends --csv
```
