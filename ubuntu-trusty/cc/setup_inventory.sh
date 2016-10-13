#!/bin/bash

# looking for target

if [ ! -d /etc/ansible ]; then
  mkdir /etc/ansible
fi

# default values
target_host=${TARGET_HOST:-target}
target_port=${TARGET_PORT:-22}

# look for legacy linking environment variablles
target_host=${TARGET_PORT_22_TCP_ADDR:-$target_host}
target_port=${TARGET_PORT_22_TCP_PORT:-$target_port}

cat > /etc/ansible/hosts <<EOF
target ansible_host=${target_host} ansible_port=${target_port} ansible_user=root
EOF

echo
echo "* ansible hosts contents:"
cat /etc/ansible/hosts
echo