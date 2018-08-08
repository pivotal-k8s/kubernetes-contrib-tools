#!/usr/bin/env bash

# Copyright 2014 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

# shellcheck disable=SC2128
SCRIPT_DIR=$(dirname "${BASH_SOURCE}")

boilerDir="${SCRIPT_DIR}/boilerplate/"
boiler="${boilerDir}/boilerplate.py"

verify() {
  files_need_boilerplate=($(${boiler} "$@"))

  # Run boilerplate check
  if [[ ${#files_need_boilerplate[@]} -gt 0 ]]; then
    for file in "${files_need_boilerplate[@]}"; do
      echo "Boilerplate header is wrong for: ${file}" >&2
    done

    return 1
  fi
}

ensure() {
  "$boiler" --ensure "$@"
}

case "$0" in
  */ensure-boilerplate.sh)
    ensure "$@"
    ;;
  */verify-boilerplate.sh)
    verify "$@"
    ;;
  *)
    echo "unknown command '$0'" >&2
    exit 1
    ;;
esac
