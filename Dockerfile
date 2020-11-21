FROM wfjm/cbm-daq-ci-base-ub-focal

LABEL maintainer="w.f.j.mueller@gsi.de" \
      description="CBM DAQ CI/CD - Ubuntu Focal (20.04 LTS) Build"

ENV TIME_STYLE=long-iso
ENV TIMEFORMAT='real %3lR   user %3lU   sys %3lS'

COPY install.sh /tmp/
RUN cd /tmp && ./install.sh

CMD bash
