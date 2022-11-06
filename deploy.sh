#!/bin/bash
set -x
set -e
set -o pipefail

URL='git@github.com:KeszeiTheOne/keszeitheone.github.io.git'
BRANCH=gh-pages
BRANCH_FROM=$(git rev-parse --abbrev-ref HEAD)
SRC=$(pwd)
TEMP=$(mktemp -d)
TEMP2=$(mktemp -d)
trap "rm -rf ${TEMP}" EXIT
trap "rm -rf ${TEMP2}" EXIT

cp -R . ${TEMP}
cd ${TEMP}

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
cd ${TEMP}

mv blog.dist.zip ${TEMP2}

echo -e "\nPreparing ${BRANCH} branch:"
if [ -z "$(git branch -a | grep origin/${BRANCH})" ]; then
  git checkout --orphan "${BRANCH}"
else
  git checkout "${BRANCH}"
fi

echo -e "\nDeploying into ${BRANCH} branch:"
rm -rf *

mv ${TEMP2}/blog.dist.zip .
unzip blog.dist.zip
rm .gitignore
rm -rf .idea
rm blog.dist.zip

git add .
git commit -am "new version $(date)" --allow-empty
git push origin ${BRANCH} 2>&1 | sed 's|'$URL'|[skipped]|g'

cd ${SRC}