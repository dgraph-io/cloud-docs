#!/bin/bash
# This script runs in a loop (configurable with LOOP), checks for updates to the
# Hugo docs theme or to the docs on certain branches and rebuilds the public
# folder for them. It has be made more generalized, so that we don't have to
# hardcode versions.

# Warning - Changes should not be made on the server on which this script is running
# becauses this script does git checkout and merge.

set -e

# Important for clean builds on Netlify
if ! git remote | grep -q origin ; then
    git remote add origin https://github.com/verneleem/cloud-docs.git
    git fetch --all
fi

GREEN='\033[32;1m'
RESET='\033[0m'
HOST="${HOST:-https://dgraph.io/docs/cloud}"
# Name of output public directory
PUBLIC="${PUBLIC:-public}"
# LOOP true makes this script run in a loop to check for updates
LOOP="${LOOP:-true}"
# Binary of hugo command to run.
HUGO="${HUGO:-hugo}"
THEME_BRANCH="${THEME_BRANCH:-master}"

rebuild() {
	echo -e "$(date) $GREEN Updating docs for branch: master.$RESET"

	VERSION_STRING="master"
	# In Unix environments, env variables should also be exported to be seen by Hugo
	export CURRENT_BRANCH="master"
	export CURRENT_VERSION="master"
	export VERSIONS="master"
	
	HUGO_TITLE="Dgraph Cloud Docs"\
		VERSIONS="master"\
		CURRENT_BRANCH="master"\
		CURRENT_VERSION="master" ${HUGO} \
		--destination=$PUBLIC/\
		--baseURL=$HOST/ 1> /dev/null
}

branchUpdated()
{
	UPSTREAM=$(git rev-parse "@{u}")
	LOCAL=$(git rev-parse "@")

	if [ "$LOCAL" != "$UPSTREAM" ] ; then
		git merge -q origin/master
		return 0
	else
		return 1
	fi
}


firstRun=1
while true; do
	# Lets move to the docs directory.
	pushd "$(dirname "$0")/.." > /dev/null

	if [ "$firstRun" = 1 ];
	then
		# clone the hugo-docs theme if not already there
		[ ! -d 'themes/hugo-docs' ] && git clone https://github.com/verneleem/hugo-docs themes/hugo-docs
	  echo -e "Cloned verneleem/hugo-docs repo into themes/hugo-docs"
	fi

	# Lets check if the theme was updated.
	pushd themes/hugo-docs > /dev/null
	git remote update > /dev/null
	themeUpdated=1
	if branchUpdated ; then
		echo -e "$GREEN Theme has been updated. Now will update the docs.$RESET"
		themeUpdated=0
	fi
	popd > /dev/null

	echo -e "$(date) Starting to check if need to (re)build."
	git remote update > /dev/null

	if branchUpdated ; then
		git merge -q origin/master
		rebuild
	fi

	folder=$PUBLIC
	if [ "$firstRun" = 1 ] || [ "$themeUpdated" = 0 ] || [ ! -d "$folder" ] ; then
		rebuild
	fi

	echo -e "$(date) Done (re)building."

	popd > /dev/null

	firstRun=0
  if ! $LOOP; then
    exit
  fi
	sleep 60
done