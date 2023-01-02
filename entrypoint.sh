#!/bin/sh

# shellcheck disable=SC2034
contur=$1
./env.sh "$contur" >>.env &
# shellcheck disable=SC2050
if [ "$contur" = "PreCommitTest" ]; then
  echo "$contur"ß
  docker-compose -f docker-compose.yml up --build --exit-code-from api-test
elif [ "$contur" = "CITest" ]; then
  echo "$contur"
  docker-compose -f docker-compose.yml -f docker-compose.ci.yml up --build --exit-code-from api-test
elif [ "$contur" = "Local" ]; then
  echo "$contur"
  docker-compose -f docker-compose.yml up --build
else
  echo No countur settings "$contur"
fi
