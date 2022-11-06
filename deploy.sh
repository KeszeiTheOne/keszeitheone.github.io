#!/bin/bash
set -x
set -e
set -o pipefail

URL='git@github.com:KeszeiTheOne/keszeitheone.github.io.git'
BRANCH=gh-pages
BRANCH_FROM=$(git rev-parse --abbrev-ref HEAD)
SRC=$(pwd)
TEMP=$(mktemp -d)
trap "rm -rf ${TEMP}" EXIT

echo -e "\nBuilding Jekyll site:"
rm -rf _dist
rm -rf blog.dist.zip

lando build

if [ ! -e _dist ]; then
  echo -e "\nJekyll didn't generate anything in _dist!"
  exit -1
fi

cd _dist
zip -r ../blog.dist.zip .
cd ${SRC}

mv blog.dist.zip ${TEMP}

echo -e "\nPreparing ${BRANCH} branch:"
if [ -z "$(git branch -a | grep origin/${BRANCH})" ]; then
  git checkout --orphan "${BRANCH}"
else
  git checkout "${BRANCH}"
fi

echo -e "\nDeploying into ${BRANCH} branch:"
rm -rf *