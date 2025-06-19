#!/bin/bash
cd "$(dirname "$0")/../.." || exit 1
if [[ $COMPOSE_COMMAND =~ ^docker.* ]]
then
        COMPOSE_COMMAND="${COMPOSE_COMMAND}" ./hack/local-shared/do exec api ./configuration-service oscal import -f oscal-content
else
        COMPOSE_COMMAND="${COMPOSE_COMMAND}" ./hack/local-shared/do exec api -- ./configuration-service oscal import -f oscal-content
fi
