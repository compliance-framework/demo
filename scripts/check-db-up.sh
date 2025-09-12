#!/bin/bash

while docker exec -i postgres-db psql -t -Upostgres ccf <<< 'select 1 from profiles' 2>&1 | grep -iw error
do
        echo "Database not ready, waiting 1 second..."
        sleep 1
done
echo "Database is ready"
