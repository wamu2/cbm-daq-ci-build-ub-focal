#!/bin/bash
#
set -o pipefail
set -e
set -x

# OS version info
grep VERSION /etc/os-release

# install googletest
cd /tmp
git clone https://github.com/google/googletest.git
cd googletest
mkdir build
cd build
cmake ..
make
make install

# drop tmp files
cd ..
rm -rf /tmp/*
