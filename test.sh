#!/usr/bin/env bash

set -e
set -u
set -o pipefail

ROOT_DIR="$( cd "$(dirname "$0")" ; pwd )"

echo '----[ boilerplate tests ]----'
pushd "${ROOT_DIR}/boilerplate" >/dev/null
  python -m unittest boilerplate_test
popd >/dev/null
