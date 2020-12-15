#!/bin/bash

docker build --no-cache -t gosl/ompi:latest .
docker images -q -f "dangling=true" | xargs docker rmi
