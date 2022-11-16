#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Please provide backup folder name as command line argument"
    exit 1
fi

docker cp $1/server/uploads kaholo-enterprise_server_1:/bigbird/static_cdn/
docker cp $1/server/plugins kaholo-enterprise_server_1:/bigbird/server/libs/
mongorestore --uri mongodb://localhost:27017/kaholo --archive=$1/mongodump.gz --gzip --drop