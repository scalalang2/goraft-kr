#!/bin/bash

set -eo pipefail

echo "Generating proto codes"
cd proto
proto_dirs=$(find ./ -path -prune -o -name '*.proto' -print0 | xargs -0 -n1 dirname | sort | uniq)
for dir in $proto_dirs; do
    protoc \
        --go_out .. \
        --go-grpc_out .. \
        $(find "$dir" -maxdepth 1 -name '*.proto')
done
