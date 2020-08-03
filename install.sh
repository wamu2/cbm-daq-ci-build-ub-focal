#!/bin/bash
#
set -o pipefail
set -e
set -x

# define versions
export VTAG_GTEST=tags/release-1.10.0
export VTAG_MSGPACK_CPP=70912ff

# OS version info
grep VERSION /etc/os-release

# install googletest
cd /tmp
git clone https://github.com/google/googletest.git
cd googletest
git checkout $VTAG_GTEST
mkdir build
cd build
cmake ..
make
make install

# install msgpack cpp
cd /tmp
git clone https://github.com/msgpack/msgpack-c.git
cd msgpack-c
git checkout cpp_master
git checkout $VTAG_MSGPACK_CPP
cd include
cp -a * /usr/local/include

# drop tmp files
cd ..
rm -rf /tmp/*
