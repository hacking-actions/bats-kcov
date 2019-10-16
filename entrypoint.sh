#!/usr/bin/env bash
set -e

if [[ -z "${CODECOV_TOKEN}" ]]; then
    echo "Must set CODECOV_TOKEN in env"
    exit 1
fi

cd "$GITHUB_WORKSPACE"

kcov --bash-dont-parse-binary-dir \
     --include-path=. \
     /var/tmp/coverage \
     bats -t tests
     
cd /var/tmp/coverage

/usr/local/bin/codecov