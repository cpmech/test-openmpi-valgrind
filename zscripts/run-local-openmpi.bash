#!/bin/bash

MPIRUN=/usr/local/bin/mpirun

CC=mpicc CXX=mpicxx cmake -B build
cd build
make
valgrind --leak-check=full $MPIRUN -np 1 ./project