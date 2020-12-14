#set(CMAKE_C_COMPILER "/opt/intel/oneapi/mpi/2021.1.1/bin/mpiicc")
#set(CMAKE_CXX_COMPILER "/opt/intel/oneapi/mpi/2021.1.1/bin/mpiicpc")

cmake_minimum_required(VERSION 3.0.0)
project(project VERSION 0.1.0)

add_executable(project main.cpp)
