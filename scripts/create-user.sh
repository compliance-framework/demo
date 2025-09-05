#!/bin/bash
cd "$(dirname "$0")/.." || exit 1
pwd
if [[ $COMPOSE_COMMAND =~ ^docker.* ]]
then
        ${COMPOSE_COMMAND} -f docker-compose.yml exec api ./api users add -e admin@example.com -f Tony -l Smith -p password
else
        $COMPOSE_COMMAND -f docker-compose.yml exec api -- ./api users add -e admin@example.com -f Tony -l Smith -p password
fi
