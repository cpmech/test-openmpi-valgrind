#!/bin/bash

MPIRUN=/opt/intel/oneapi/mpi/2021.1.1/bin/mpirun

CC=mpiicc CXX=mpiicpc cmake -B build
cd build
make
valgrind --suppressions=/opt/intel/oneapi/itac/2021.1.1/lib/impi.supp --leak-check=full $MPIRUN -np 1 ./project
