cmake_minimum_required(VERSION 3.0.0)
project(project VERSION 0.1.0)

include(CTest)
enable_testing()

find_package(MPI)
include_directories(${MPI_CXX_INCLUDE_PATH})
set(LIBS ${LIBS} ${MPI_CXX_LIBRARIES})

add_executable(project main.cpp)
target_link_libraries(project PUBLIC ${LIBS})

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
