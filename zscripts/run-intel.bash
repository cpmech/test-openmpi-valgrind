#!/bin/bash

CC=mpiicc
MPIRUN=/opt/intel/oneapi/mpi/latest/bin/mpirun
MYBIN=/tmp/test-ompi-valgrind

echo
echo
echo
echo "with valgrind ###########################################################"
$CC -o $MYBIN main.c && valgrind --leak-check=full $MPIRUN -np 1 $MYBIN

echo
echo
echo
echo "with -check_mpi #########################################################"
$MPIRUN -check_mpi -l -n 1 $MYBIN