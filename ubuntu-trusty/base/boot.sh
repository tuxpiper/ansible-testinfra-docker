#!/bin/bash

run_boot_dir() {
  if [ ! -d $1 ]; then
    return 0;
  fi
  for f in $(find $1 -type f | sort); do
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
}

run_boot_dir /boot.d
run_boot_dir /boot.vol.d

if [ -z "$*" ]; then
  exec /sbin/init
else
  echo "Running $*"
  exec $*
fi
