#!/bin/sh
set -o errexit

REPORT_FILE=$(mktemp -u).console

/usr/local/bin/psalm \
  --output-format='github' \
  --report="${REPORT_FILE}" \
  --report-show-info='false' \
  --threads="$(nproc)" \
  "${@}" || EXIT_CODE=${?}

test -f "${REPORT_FILE}" && cat "${REPORT_FILE}"

exit "${EXIT_CODE}"
