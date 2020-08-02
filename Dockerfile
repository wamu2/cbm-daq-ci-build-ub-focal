FROM wfjm/cbm-daq-ci-base-ub-focal

ENV TIME_STYLE=long-iso
ENV TIMEFORMAT='real %3lR   user %3lU   sys %3lS'

COPY install.sh /tmp/
RUN cd /tmp && ./install.sh

CMD bash
