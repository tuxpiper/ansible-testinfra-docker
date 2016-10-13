FROM ubuntu-upstart:trusty

RUN apt-get update && \
    apt-get install -y curl rsync && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY boot.sh /
COPY boot.d /boot.d/

ENTRYPOINT [ "/bin/bash", "/boot.sh" ]
