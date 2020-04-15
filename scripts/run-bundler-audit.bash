#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

echo "Running Bundler-audit"
bundle exec bundler-audit
