#!/bin/bash

# Generates:
#   - Java API docs HTML (/webapi-parser/docs/java)
#   - Java API -javadoc.jar file
#
# NOTES:
#   - Call this script from the root of webapi-parser project;

mkdir -p docs/java

echo "Generating Java docs"
sbt webapiJVM/genjavadoc:doc
rm ./jvm/target/java/webapi/*$.java
sbt webapiJVM/packageDoc
cp -r ./jvm/target/scala-2.12/genjavadoc-api/* ./docs/java
