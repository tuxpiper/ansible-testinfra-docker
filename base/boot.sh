#!/bin/bash

for f in $(find /boot.d -type f | sort); do
  case "$f" in
    *.sh)
      echo "running $f..."
      pushd $(dirname $f)
      bash $(basename $f)
      popd
      ;;
    *)
      echo "ignoring $f"
      ;;
  esac
done

if [ -z "$*" ]; then
  exec /sbin/init
else
  echo "Running $*"
  exec $*
fi
