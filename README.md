This project is part of the [DockerHub image](https://hub.docker.com/u/wfjm)
build setup for tests of the CBM DAQ CI/CD pipelines under GitLab.

It creates an image with all required packages for Ubuntu Focal (20.04 LTS)
based tests.

It is based on the OS base image
[cbm-daq-ci-base-ub-focal](https://github.com/wamu2/cbm-daq-ci-base-ub-focal).

Installed packages and reasoning behind:
- `googletest`: used by msgpack verification
- `msgpack`: install latest version (C,C++ splitt now, C++ header only)
- `libzmq`: install latest version
- `cppzmp`: install latest version to get C++11 aware implementation
