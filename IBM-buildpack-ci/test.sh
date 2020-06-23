#!/bin/bash

set -euo pipefail

WORKSPACE="$(cd "$(dirname "${BASH_SOURCE[0]}")/" && pwd)"

echo "[INFO] Find the real path of sample apps"
pushd "$WORKSPACE/builder" >/dev/null 2>&1
  fixtures=$(realpath fixtures)
  fs3fixtures="$(realpath fs3-fixtures)"
  tinyfixtures="$(realpath tiny-fixtures)"
popd >/dev/null 2>&1

echo "[INFO] Building test apps..."
pushd "$WORKSPACE/test-builder" >/dev/null 2>&1
  go test -args "$tinyfixtures" -v
  go test -args "$fixtures" -v
	go test -args "$fs3fixtures" -v
popd
