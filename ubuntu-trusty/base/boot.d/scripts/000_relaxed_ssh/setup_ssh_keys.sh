#!/bin/bash

set -e

SSH_CONFIG=/etc/ssh/ssh_config

# Disable host key stuff
disable_host_key_checking() {
  is_configured() { grep -q -E "^\s*$1" $SSH_CONFIG ; }
  if ! is_configured "CheckHostIP" ; then
    echo "   CheckHostIP no" >> $SSH_CONFIG
  fi
  if ! is_configured "StrictHostKeyChecking" ; then
    echo "   StrictHostKeyChecking no" >> $SSH_CONFIG
  fi
  if ! is_configured "UserKnownHostsFile" ; then
    echo "   UserKnownHostsFile /dev/null" >> $SSH_CONFIG
  fi
}

# Add .ssh/id_rsa and .ssh/authorised keys to /root and skel for new user accounts
configure_authorized_key() {
  ssh_authorised_key_dir=/boot.d/files/ssh_authorised_key
  copy_keys() {
    local target=$1
    [ ! -d $target/.ssh ] && mkdir --mode=0700 $target/.ssh
    [ ! -f $target/.ssh/id_rsa ] && cp -p $ssh_authorised_key_dir/id_rsa $target/.ssh/id_rsa
    [ ! -f $target/.ssh/authorized_keys ] && cp $ssh_authorised_key_dir/id_rsa.pub $target/.ssh/authorized_keys
    chmod 0600 $target/.ssh/id_rsa $target/.ssh/authorized_keys
  }
  if [ -f $ssh_authorised_key_dir/id_rsa ]; then
    copy_keys /root
    copy_keys /etc/skel
  fi
}

disable_host_key_checking ;
configure_authorized_key ;
