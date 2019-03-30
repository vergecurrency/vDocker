#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for verged"

  set -- verged "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "verged" ]; then
  mkdir -p "$VERGE_DATA"
  chmod 755 "$VERGE_DATA"

  echo "$0: setting data directory to $VERGE_DATA"

  set -- "$@" -datadir="$VERGE_DATA"
fi

if [ "$1" = "verged" ] || [ "$1" = "verge-cli" ] || [ "$1" = "verge-tx" ]; then
  echo
  exec gosu root "$@"
fi

echo
exec "$@"