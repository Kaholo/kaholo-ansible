#!/bin/bash
#
# The docker-compose.yml includes a LICENSE_PUBLIC_KEY=value
# The public key is used to decode the license.
# If the license is NOT created using the matching public key it cannot work.
# Whoever provides the license must also provide the matching public key.
# Put the correct public key in docker-compose... for example...
#
# - LICENSE_PUBLIC_KEY=-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAtWQZv7QUIEGEGe7Vpuqn\nLtIGumq3uQiJCN20UDfo/wft/LvJeXPOb12BQIIcHh7XNHEb8j5ctxf3JaJHxDmr\ndH9s3qQ+t0IRhwoOVakZAcINAlX2OHXDmyFoYwme6/c5O6YuqbtzeMHK9UKvkIud\nN7VJlpD9cWMH67VuqT3OEo3wvbrF9nLcdPi7s7WjB9MxRv5pPnHZKAVhPONwpwb8\nzSDt+Cu9YlLZoHGLmhjtN2eL2R4EC3ge0PoYFfqAFeJYBHvI2umy4LEhdBHypAun\nwflH6jTEpA9DPNrgnBICqrbDxqtgMurwBUXLKJmwJw1XNiH+gPWCTsf1pxwu1SPX\nRbpm5MUDa+EoT7lzQVjyrSYArWPqSMx/KytGF5TswIwHK+CW8KJeiNAo4VUlLKHp\nduhuQXn5bBVZ06Hm5OlxWNKx5183bOe6ngm9/QJcqdPE9BOhA9C4j9zUYWTg2W+7\nGvVsP5MGrQ4GoCWG+ZvfJ8niexTWF1welyt8jZLOCRnOPrg5OZW3xV4tysLicEJr\nk3RWGQ39jaWFcvnOy9KMpeZDERD4Mm/QCqtdlQ0Dh/eMcxtfAlh32lqujVZxgFej\nqjgKrlrKAwcUdxt25oH1lg6rAzKKGwuyrFY/mcZK8hLUgUJFdfmwtSgvqUqcJX6v\nPqdoyH37f9pg7WnDnI2u6P0CAwEAAQ==\n-----END PUBLIC KEY-----
#
cd /home/ubuntu/kaholo-enterprise/docker-development/
grep LICENSE_PUBLIC_KEY docker-compose.yml
echo MANUAL STEP