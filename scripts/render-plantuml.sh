#!/bin/bash

PLANTUML_JAR="`pwd`/`dirname $0`/plantuml-1.2022.1.jar"
DIAGRAMS_HOME="`pwd`/`dirname $0`/../docs/diagrams"

cd "${DIAGRAMS_HOME}/src"

for puml in "*.puml"
do
  echo $puml
  java -jar "$PLANTUML_JAR" -o "${DIAGRAMS_HOME}/out" "$puml"
done
