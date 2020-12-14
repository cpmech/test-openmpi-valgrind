#!/bin/bash

MPIRUN=/opt/intel/oneapi/mpi/2021.1.1/bin/mpirun

CC=mpiicc CXX=mpiicpc cmake -B build
cd build
make
$MPIRUN -check_mpi -l -n 1 ./project
