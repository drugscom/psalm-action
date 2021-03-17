#!/bin/sh
set -o errexit

/usr/local/bin/psalm --output-format='github' --threads "$(grep -c '^processor' /proc/cpuinfo)" "${*}"
