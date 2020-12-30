#!/bin/bash
#
set -o pipefail
set -ex

# define versions
export VTAG_GTEST=tags/release-1.10.0
export VTAG_MSGPACK_CPP=70912ff
export VTAG_LIBZMQ=tags/v4.3.2
export VTAG_CPPZMQ=tags/v4.6.0
export VTAG_FMTLIB=cc09f1a6

# OS version info
grep VERSION /etc/os-release
# processor capabilities
nproc

# setup directories
mkdir -p ~/dca_prerequisites
mkdir -p /tmp/dca_prerequisites

# install googletest
cd /tmp/dca_prerequisites
git clone https://github.com/google/googletest.git
cd googletest
git checkout $VTAG_GTEST
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=~/dca_prerequisites ..
make -j $(nproc)
make install

# install msgpack cpp
cd /tmp/dca_prerequisites
git clone https://github.com/msgpack/msgpack-c.git
cd msgpack-c
git checkout cpp_master
git checkout $VTAG_MSGPACK_CPP
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=~/dca_prerequisites \
      -DMSGPACK_BUILD_TESTS=OFF -DMSGPACK_BUILD_EXAMPLES=OFF ..
make install

# install libzmq
cd /tmp/dca_prerequisites
git clone https://github.com/zeromq/libzmq.git
cd libzmq
git checkout $VTAG_LIBZMQ
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=~/dca_prerequisites ..
time make -j $(nproc)
make install

# install cppzmq
cd /tmp/dca_prerequisites
git clone https://github.com/zeromq/cppzmq.git
cd cppzmq
git checkout $VTAG_CPPZMQ
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=~/dca_prerequisites -DCPPZMQ_BUILD_TESTS=OFF ..
time make -j $(nproc)
make install

# install fmtlib
cd /tmp/dca_prerequisites
git clone https://github.com/fmtlib/fmt.git
cd fmt
git checkout $VTAG_FMTLIB
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=~/dca_prerequisites ..
time make -j $(nproc)
make install

# drop tmp files
cd ..
rm -rf /tmp/dca_prerequisites
