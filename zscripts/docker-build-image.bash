#!/bin/bash

docker build --no-cache -t test-ompi .
docker images -q -f "dangling=true" | xargs docker rmi
