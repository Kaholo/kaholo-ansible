#!/bin/bash
#
# The docker-compose.yml for kaholo, rabbitmq, and redis do NOT restart them after reboot
# We want the kaholo server to come up running after reboot or failure so we must make 
# SOME of the services in these THREE files include after image:...
#  restart: unless-stopped
# 

cd /home/ubuntu/kaholo-enterprise/docker-development/
grep -B1 restart docker-compose.yml ../rabbitmq/docker-compose.yml ../redis/docker-compose.yml 
echo MANUAL STEP

# docker-compose.yml-    image: mongo:4.2
# docker-compose.yml:    restart: unless-stopped
# --
# docker-compose.yml-    image: server
# docker-compose.yml:    restart: unless-stopped
# --
# docker-compose.yml-    image: twiddlebug
# docker-compose.yml:    restart: unless-stopped
# --
# docker-compose.yml-    image: cookie-monster-pipeline-execution-service
# docker-compose.yml:    restart: unless-stopped
# --
# docker-compose.yml-    image: cookie-monster-action-execution-service
# docker-compose.yml:    restart: unless-stopped
# --
# docker-compose.yml-    image: cookie-monster-state-service
# docker-compose.yml:    restart: unless-stopped
# --
# docker-compose.yml-    image: cookie-monster-mongo-service
# docker-compose.yml:    restart: unless-stopped
# --
# docker-compose.yml-    image: cookie-monster-flow-control
# docker-compose.yml:    restart: unless-stopped
# --
# docker-compose.yml-    image: cookie-monster-queues
# docker-compose.yml:    restart: unless-stopped
# --
# docker-compose.yml-    image: cookie-monster-code-layer-service
# docker-compose.yml:    restart: unless-stopped
# --
# docker-compose.yml-    image: cookie-monster-scheduler-service
# docker-compose.yml:    restart: unless-stopped
# --
# docker-compose.yml-    image: cookie-monster-error-service
# docker-compose.yml:    restart: unless-stopped
# --
# docker-compose.yml-    image: development-ssh-monitor
# docker-compose.yml:    restart: unless-stopped
# --
# ../rabbitmq/docker-compose.yml-    image: rabbitmq:3.8.9-management
# ../rabbitmq/docker-compose.yml:    restart: unless-stopped
# --
# ../redis/docker-compose.yml-    image: redis:6.2.6
# ../redis/docker-compose.yml:    restart: unless-stopped
