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
    <img class="hero-deco" src="/images/hero-deco.png" />
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
    <div class="icon"><i class="fa fa-university" aria-hidden="true"></i></div>
    <a href="{{< relref "advanced-queries.md">}}">
      <h2>Advanced Queries with DQL</h2>
      <p>
        How to interact with your database via the gRPC endpoint
      </p>
    </a>
  </div>
  <div class="item">
    <div class="icon"><i class="fa fa-code-fork" aria-hidden="true"></i></div>
    <a href="{{< relref "one-click-deploy.md">}}">
      <h2>One-click Deploy</h2>
      <p>
        How to deploy sample apps in a fresh backend instance
      </p>
    </a>
  </div>

  <div class="item">
    <div class="icon"><i class="lni lni-graduation" aria-hidden="true"></i></div>
    <a href="{{< relref "security.md">}}">
      <h2>Securing your GraphQL endpoint</h2>
      <p>
        Tips for securing your Slash GraphQL Backend
      </p>
    </a>
  </div>
  <div class="item">
    <div class="icon"><i class="lni lni-fireworks" aria-hidden="true"></i></div>
    <a href="{{< relref "migrating-from-hosted-dgraph.md">}}">
      <h2>Migrating from hosted Dgraph</h2>
      <p>
        Easily migrate your existing Dgraph app over to Slash
      </p>
    </a>
  </div>
  <div class="item">
    <div class="icon"><i class="fa fa-cog" aria-hidden="true"></i></div>
    <a href="{{< relref "admin/_index.md">}}">
      <h2>Administering your Backend</h2>
      <p>
        How to programatically set your schema, and import/export your data 
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
