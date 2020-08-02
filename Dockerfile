FROM wfjm/cbm-daq-ci-base-ub-focal

COPY install.sh /tmp/
RUN cd /tmp && ./install.sh

CMD bash
