#!/bin/bash
cd "$(dirname "$0")/../.." || exit 1
set -x
if [[ $COMPOSE_COMMAND =~ ^docker.* ]]
then
        COMPOSE_COMMAND="${COMPOSE_COMMAND}" ./hack/local-shared/do exec api ./configuration-service users add -e admin@example.com -f Tony -l Smith -p password
else
        COMPOSE_COMMAND="${COMPOSE_COMMAND}" ./hack/local-shared/do exec api -- ./configuration-service users add -e admin@example.com -f Tony -l Smith -p password
fi
