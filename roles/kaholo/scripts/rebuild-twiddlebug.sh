#!/bin/bash
#
# rebuild the Kaholo agent (twiddlebug)
#
cd /home/ubuntu/kaholo-enterprise/docker-development/
docker container stop kaholo-enterprise_twiddlebug_1
docker container rm kaholo-enterprise_twiddlebug_1
docker-compose -f ../ci-context-compose.yml -f ../rabbitmq/docker-compose.yml -f ../rabbitmq/docker-compose.override.yml -f ../redis/docker-compose.yml -f ../redis/docker-compose.override.yml -f ../keycloak/docker-compose.yml -f ../docker-development/docker-compose.yml up --no-start twiddlebug
docker-compose -f ../ci-context-compose.yml -f ../rabbitmq/docker-compose.yml -f ../rabbitmq/docker-compose.override.yml -f ../redis/docker-compose.yml -f ../redis/docker-compose.override.yml -f ../keycloak/docker-compose.yml -f ../docker-development/docker-compose.yml start twiddlebug