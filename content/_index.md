+++
title = "Slash GraphQL"
weight = 4
[menu.main]
  identifier = "slash-graphql"
+++

<div class="landing">
  <div class="hero">
    <h1></h1>
    <p>
      Slash GraphQL provides a <code>/graphql</code> Backend for your app.
    </p>
    <img class="hero-deco" src="images/hero-deco.png" />
  </div>
  <div class="item">
    <div class="icon"><i class="lni lni-play" aria-hidden="true"></i></div>
    <a  href="{{< relref "slash-quick-start.md">}}">
      <h2>Slash Quick Start</h2>
      <p>
        Get started with a simple "to-do" list app built on Slash GraphQL
      </p>
    </a>
  </div>
  <div class="item">
    <div class="icon"><i class="lni lni-rocket" aria-hidden="true"></i></div>
    <a href="{{< relref "advanced-queries.md">}}">
      <h2>Advanced Queries with DQL</h2>
      <p>
        Generate advanced queries to interact with your database using the HTTP or gRPC endpoint 
      </p>
    </a>
  </div>
  <div class="item">
    <div class="icon"><i class="lni lni-package" aria-hidden="true"></i></div>
    <a href="{{< relref "one-click-deploy.md">}}">
      <h2>One-click Deploy</h2>
      <p>
        Deploy sample apps in minutes from a fresh backend instance
      </p>
    </a>
  </div>

  <div class="item">
    <div class="icon"><i class="lni lni-shield" aria-hidden="true"></i></div>
    <a href="{{< relref "security.md">}}">
      <h2>Securing your GraphQL endpoint</h2>
      <p>
        Tips for securing your Slash GraphQL backend
      </p>
    </a>
  </div>
  <div class="item">
    <div class="icon"><i class="lni lni-cogs" aria-hidden="true"></i></div>
    <a href="{{< relref "migrating-from-hosted-dgraph.md">}}">
      <h2>Migrating from hosted Dgraph</h2>
      <p>
        Easily migrate your existing Dgraph app to Slash
      </p>
    </a>
  </div>
  <div class="item">
    <div class="icon"><i class="lni lni-control-panel" aria-hidden="true"></i></div>
    <a href="{{< relref "admin/_index.md">}}">
      <h2>Administering your Backend</h2>
      <p>
        Programmatically set and update your schema, import or export your data, and switch or clone your Slash backend
      </p>
    </a>
  </div>
  <div class="item">
    <div class="icon"><i class="lni lni-control-panel" aria-hidden="true"></i></div>
    <a href="{{< relref "slash-cli/_index.md">}}">
      <h2>Slash GraphQL CLI</h2>
      <p>
        Slash GraphQL now includes a CLI so you can manage it from the comfort of your command line
      </p>
    </a>
  </div>

</div>

<style>
  ul.contents {
    display: none;
  }
</style>

You might also be interested in:

- [Dgraph GraphQL Schema Reference](https://dgraph.io/docs/graphql/schema/schema-overview), which lists all the types and directives supported by Dgraph
- [Dgraph GraphQL API Reference](https://dgraph.io/docs/graphql/api/api-overview), which serves as a guide to using your new `/graphql` endpoint
