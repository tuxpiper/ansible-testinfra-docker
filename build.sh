#!/bin/bash

set -e

flavors="ubuntu-trusty"

for flav in $flavors; do
	pushd $flav
	docker build -t tuxpiper/ansible-testinfra-docker:${flav} base
	docker build -t tuxpiper/ansible-testinfra-docker:${flav}-cc cc
	popd
done
