## [Dgraph Cloud Documentation](https://dgraph.io/docs/cloud/)

To read the official Dgraph documentation that is published from this repository,
please visit [dgraph.io/docs/cloud/](https://dgraph.io/docs/cloud/).

## Contribution guidelines

As a contributor to Dgraph documentation, we ask that you do the following:
- **Label your PR for easy management**: Your PR title should be in the following format: **Topic (area): details**. The **topic** is either "Docs", "Nav" (aka, navigation), or "Chore" (for build fixes, cherry-picks, etc). The **area** is the feature (i.e. "GraphQL"), area of the docs (i.e., "Deployment"), or "Other" (for typo fixes and other bugfix PRs). So, example PR names include:
 *Docs(GraphQL): Document the @deprecated annotation* or *Chore(Other): cherry-pick updates from master to release/v20.11*
- **Develop in the `master` branch first**: Make any changes applicable to the current (recently-released) version of Dgraph in the `master` branch first.

- **Link to discuss.dgraph.io posts when applicable**: If your PR is based on discussions on Discuss, feel free to include a link to the relevant discussion in your PR description.

- **Technical writing style**: As much as possible, please follow technical writing style conventions (More on this below).

- **(Dgraph core team only)**: Include the ID of any issues/tickets related to your PR in the description (i.e., "Fixes DGRAPH-12345" or "Per DGRAPH-54321").

### Technical writing style

Dgraph Labs uses a style guide for our documentation so that we can make it as easy to understand as possible. The [Dgraph Style Guide](https://discuss.dgraph.io/t/dgraph-developer-documentation-style-guide/10955) is a concise style reference for our documentation, but it isn't comprehensive. For anything not found in our style guide, use Google's [Developer Docs Style Guide](https://developers.google.com/style/highlights).

#### Style tips for machine-translatable docs!

Making our documentation easy to understand includes optimizing it for client-side machine translation into other languages. To help with this, please see the following technical writing style tips:
- Generally, use the second person ("you") rather than the third-person ("the developer") when addressing the reader.
- Always use the third person when describing Dgraph database or features (avoid "this lets us" in favor of "this lets Dgraph").
- Write in present-tense, active voice when you can.
- Prefer simple sentences to complex and complex-compound sentences.

**Note:** Please don't let these style conventions stop you from creating a PR to share your contribution to Dgraph Docs! PR reviewers can help with style guide issues.

## Staging doc updates locally

We use [Hugo](https://gohugo.io/) for our documentation. You can use Hugo to locally stage doc updates before or after creating a PR.


### Steps to build

1. Download and install the latest patch of hugo version v0.79.x from [here](https://github.com/gohugoio/hugo/releases).
  ```bash
  pushd ~/Downloads
  VERSION=v0.79
  TAG=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases | jq '.[].tag_name' -r | grep $VERSION | head -1)
  OS=$(uname -s)
  if [[ ${OS,,} == "darwin" ]]; then
     PKG=hugo_${TAG##v}_macOS-64bit.tar.gz
     curl -sLO https://github.com/gohugoio/hugo/releases/download/${TAG}/${PKG}
     tar xvzf $PKG hugo
     sudo mv hugo /usr/local/bin/
   else
     PKG=hugo_${TAG##v}_Linux-64bit.deb
     curl -sLO https://github.com/gohugoio/hugo/releases/download/${TAG}/${PKG}
     sudo apt install $PKG
   fi
   popd
   ``` 
2. Run the command below to get the theme.
   ```bash
   pushd themes && git clone https://github.com/dgraph-io/hugo-docs && popd
   ```
3. Run `./scripts/local.sh` and visit [http://localhost:1313](http://localhost:1313) to see the documentation site running on your local machine.

### Theme

The documentation uses a `hugo` theme which can be found at https://github.com/dgraph-io/hugo-docs.
