#!/bin/sh

# shellcheck disable=SC2154
# shellcheck disable=SC2034
contur=$1
rm -rf .env

# shellcheck disable=SC2050
if [ "$contur" = "PreCommitTest" ]; then
  # shellcheck disable=SC2129
  mkdir reports
  # shellcheck disable=SC2129
  echo CONTOUR=PreCommitTest >>.env
  echo API_ENTRYPOINT=./badges.sh >>.env
  echo API_SERVICE_REPORTS=reports/ >>.env
  # redis
  echo REDIS_HOST=redis >>.env
  echo REDIS_PORT=6379 >>.env

elif [ "$contur" = "CITest" ]; then
  # shellcheck disable=SC2129
  echo CONTOUR=CITest >>.env
  echo API_ENTRYPOINT=./badges.sh >>.env
  echo API_SERVICE_REPORTS=/builds/GavrilovStepan01/AwesomeGitLab/reports >>.env
  # redis
  echo REDIS_HOST=redis >>.env
  echo REDIS_PORT=6379 >>.env

elif [ "$contur" = "Local" ]; then
  # shellcheck disable=SC2129
  rm -rf reports
  mkdir reports
  # shellcheck disable=SC2129
  echo CONTOUR=Local >>.env
  echo API_ENTRYPOINT='uvicorn src.asgi:app --host 0.0.0.0 --reload --port 9999' >>.env
  echo API_SERVICE_REPORTS=reports/ >>.env
  # redis
  echo REDIS_HOST=redis >>.env
  echo REDIS_PORT=6379 >>.env

elif [ "$contur" = "Prod" ]; then
  # shellcheck disable=SC2129
  # shellcheck disable=SC2129
  echo CONTOUR=Prod >>.env
  echo API_ENTRYPOINT='uvicorn src.asgi:app --host 0.0.0.0 --reload --port 9999' >>.env
  echo API_SERVICE_REPORTS=reports/ >>.env
  # redis
  echo REDIS_HOST=redis >>.env
  echo REDIS_PORT=6379 >>.env
else
  echo No countur settings "$contur"
fi
