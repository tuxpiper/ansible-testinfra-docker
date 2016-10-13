[![Build Status](https://travis-ci.org/tuxpiper/ansible-testinfra-docker.svg?branch=master)](https://travis-ci.org/tuxpiper/ansible-testinfra-docker)

# Docker container images for Ansible playbook testing against Ubuntu

There are two Docker container images defined here

* **base** - it's your usual ubuntu upstart image, with the twist that it's set up to make SSH connections very smooth for automation. Meaning, insecure :) Be careful not to use this image anywhere where network security counts even a little bit! You've been warned.

* **host** - it's built on top of base, adding `ansible` and `testinfra`. This is the image you want to use for the host that will run playbooks and tests.

The `tests` folder contains a sample test arrangement which just makes sure that a **host** container can transparently connect to another **base** container. More guidance on setting up playbook runs and tests may come in the near future.
