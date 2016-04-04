#!/bin/bash

cd $(dirname $0)

pushd test_ssh
testinfra -vvv --hosts=target test_ssh.py
popd

pushd test_ansible
testinfra -vvv --hosts=target --ansible-inventory=/etc/ansible/hosts --connection=ansible
popd
