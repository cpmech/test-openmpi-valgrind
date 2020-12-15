FROM debian:sid

# disable tzdata questions
ENV DEBIAN_FRONTEND=noninteractive

# use bash
SHELL ["/bin/bash", "-c"]

# install apt-utils
RUN apt-get update -y && \
  apt-get install -y apt-utils 2> >( grep -v 'debconf: delaying package configuration, since apt-utils is not installed' >&2 ) \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# tools and libraries
RUN apt-get update -y && apt-get install -y --no-install-recommends \
  ca-certificates \
  netbase \
  curl \
  git \
  vim-tiny \
  build-essential \
  python \
  flex \
  autoconf \
  automake \
  m4 \
  libtool \
  gcc \
  libnl-3-dev \
  libnl-route-3-dev \
  valgrind \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# install OpenMPI
RUN git clone --recurse-submodules https://github.com/open-mpi/ompi.git /tmp/ompi
WORKDIR /tmp/ompi
RUN ./autogen.pl \
  && ./configure --prefix=/usr/local --disable-man-pages --disable-dlopen \
  && make all install \
  && ldconfig
ENV PATH="/usr/local/bin:${PATH}"

# run test
WORKDIR /tmp
RUN echo $'#include <mpi.h> \n\
int main(int argc, char **argv)\n\
{\n\
  MPI_Init(&argc, &argv);\n\
  MPI_Finalize();\n\
  return 0;\n\
}\n' > main.cpp
RUN /usr/local/bin/mpicc main.cpp -o mytest && valgrind --leak-check=full mpirun -np 1 ./mytest
