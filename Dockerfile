FROM debian:sid

# tools and libraries
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
RUN apt-get update -y && apt-get install -y --no-install-recommends \
  ca-certificates \
  openssh-server \
  git \
  g++ \
  make \
  autoconf \
  automake \
  m4 \
  libtool \
  flex \
  libnl-route-3-dev \
  python \
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

# prepare test
RUN echo $'#include <mpi.h> \n\
  int main(int argc, char **argv)\n\
  {\n\
  MPI_Init(&argc, &argv);\n\
  MPI_Finalize();\n\
  return 0;\n\
  }\n' > /tmp/main.cpp
RUN mpicc -o /tmp/mytest /tmp/main.cpp
RUN echo "valgrind --leak-check=full mpirun --allow-run-as-root -np 1 /tmp/mytest" > /tmp/test.bash

# command
CMD [ "bash", "/tmp/test.bash" ]