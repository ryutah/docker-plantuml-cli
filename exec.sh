#!/bin/sh

java -DPLANTUML_LIMIT_SIZE=${PLANTUML_LIMIT_SIZE} -jar /usr/local/bin/plantuml.jar $1
