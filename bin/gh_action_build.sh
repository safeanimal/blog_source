#!/usr/bin/env bash
#
# 该脚本在Github Action里运行。主要是调用build.sh，但是事先要安装一些必要的npm库。

set -eu
set -o pipefail
set -x
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR="${SCRIPT_DIR}"/../

PROG=$(basename "$0")

# Prints a small usage help. This is called on `--help` and on parameter validation errors.
# Syntax follows http://docopt.org/.
usage() {
  cat <<EOF
${PROG} <page_repo_dir>
EOF
}

main() {
  if [[ "$*" =~ ^(-h|--help)$ ]]; then
    usage
    exit
  fi
  pushd "${REPO_DIR}" > /dev/null
  npm install hexo-cli
  npm install
  bin/build.sh
}

main "$@"