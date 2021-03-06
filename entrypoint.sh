#!/usr/bin/env bash
set -e

if [[ -z "${CODECOV_TOKEN}" ]]; then
    echo "Must set CODECOV_TOKEN in env"
    exit 1
fi

if [[ -z "${GITHUB_WORKSPACE}" ]]; then
    echo "Must set GITHUB_WORKSPACE in env"
    exit 2
fi

cd "${GITHUB_WORKSPACE}" || exit 3

ls -la
echo -e "\n"

kcov --bash-dont-parse-binary-dir \
     --include-path=. \
     /var/tmp/coverage \
     bats -t tests

/usr/local/bin/codecov -s /var/tmp/coverage -B "${GITHUB_REF##*/}"
