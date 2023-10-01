#!/bin/bash

export ES_JAVA_HOME=$(dirname "$(dirname "$(readlink -f "$(which javac || which java)")")")
exec "$@"

