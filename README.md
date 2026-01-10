# cpp-development-environment

Basic C++ development environment container for myself. It has relevant toolchain and utils. Since it is not stored in remote, you need to compile and run locally. It is possible to use with your existing ssh keys (for git etc.) thanks to docker volumes.

CMake is installed from Kitware apt repo to get the latest version. Uses **clang** as default compiler.

To build:
```
docker build -t cpp-development-environment:latest .
```

To run:
```
docker-compose up -d
```
