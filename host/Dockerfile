FROM tuxpiper/ubuntu-ansible-docker:base

RUN apt-get update && \
    apt-get install -y python-dev python-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV ANSIBLE_VERSION 2.0.1.0
RUN pip install ansible==${ANSIBLE_VERSION}

ENV TESTINFRA_VERSION 1.1.1
RUN pip install testinfra==${TESTINFRA_VERSION}

CMD "/bin/bash"
