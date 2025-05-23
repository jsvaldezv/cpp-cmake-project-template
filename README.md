# C++ Project Template with CMake

This is a minimal and clean C++ project template configured with CMake to help you get started quickly with modern C++ development. It includes a basic folder structure and build configuration that can easily scale for larger applications or libraries.

## Pre-requisites

### CMake

Before building the project you need to have CMake installed in your machine. You can use `brew install cmake` command or you can go to https://cmake.org/download/ and download the latest version for your machine OS. We recommend installing via first option but if you go with the second option after running the installer open the CMake app, go to Tools/How To Install For Command Line Use, and follow the instructions to finish installation.

To build the application on Windows you will need Visual Studio with Clang support. On the Visual Studio Installer app, make sure you install the following:

* Workloads
    * Desktop development with C++
* Individual components
    * C++ Clang Compiler for Windows
    * C++ Clang-cl for v143 build tools (x64/x86)

## How to build project with CMake?

Project configuration
```
cmake -S . -B build
```

Compilation
```
cmake --build build
```

## How to build project and open IDE? (recommended)

macOS
```
sh Scripts/build_xcode.sh
```

Windows
```
start Scripts/build_vs22.bat
```
