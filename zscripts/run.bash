#!/bin/bash

mkdir -p build
cd build
cmake ..
make
valgrind --leak-check=full ./project

