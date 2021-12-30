#! /bin/bash

export ENV=local
export TROVE_DB_URL=
export TROVE_DB_USERID=
export TROVE_DB_PASSWORD=
export TROVE_DB_MAX_POOL_SIZE=10
export JAVA_OPTS="-Dkeycloak.profile.feature.upload_scripts=enabled -Djboss.socket.binding.port-offset=1010"

# make sure we're using Java 8
sdk use java 8.0.312-zulu 

# navigate to the Keycloak home directory
cd /path/to/keycloak 

# star Keycloak in standalone mode
bin/standalone.sh
