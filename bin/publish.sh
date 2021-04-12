#!/usr/bin/env bash
#
# 该脚本下载最新的release中的静态文件包，解压到Pages库，commit & push。

set -eu
set -o pipefail

PROG=$(basename "$0")

# Prints a small usage help. This is called on `--help` and on parameter validation errors.
# Syntax follows http://docopt.org/.
usage() {
  cat <<EOF
${PROG} <page_dir>
EOF
}

main() {
  local page_dir=$1
  local latest # latest release
  latest="$(gh release list -R safeanimal/blog_source -L 1 | awk '{print $1}')" # get the latest release
  gh release download "${latest}" -R safeanimal/blog_source -p public.tar.gz
  tar -xzvf ./public.tar.gz
  rsync -v -a --delete --exclude .git ./public/ "${page_dir}"
  pushd "${page_dir}" > /dev/null
  git config --global user.email "411814789@qq.com"
  git config --global user.name "safeanimal"
  git add .
  git commit -am "sync ${latest}"
  git push
}

main "$@"