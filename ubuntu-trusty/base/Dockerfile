FROM ubuntu-upstart:trusty

COPY boot.sh /
COPY boot.d /boot.d/

ENTRYPOINT [ "/bin/bash", "/boot.sh" ]
