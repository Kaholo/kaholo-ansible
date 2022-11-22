#!/bin/bash
BAKDIR258=backup-$(date -I)
mkdir -p $BAKDIR258/server
docker cp kaholo-enterprise_server_1:/bigbird/static_cdn/uploads $BAKDIR258/server/uploads
docker cp kaholo-enterprise_server_1:/bigbird/server/libs/plugins/ $BAKDIR258/server/plugins
mongodump --uri mongodb://localhost:27017/kaholo --forceTableScan --archive=$BAKDIR258/mongodump.gz --gzip