#!/bin/sh

# shellcheck disable=SC2154
# shellcheck disable=SC2034
contur=$1
rm -rf .env

# shellcheck disable=SC2050
if [ "$contur" = "PreCommitTest" ]; then
  # shellcheck disable=SC2129
  echo CONTOUR=PreCommitTest >>.env
  echo API_ENTRYPOINT='uvicorn src.asgi:app --reload --port 9999' >>.env
  echo API_SERVICE_REPORTS=reports/ >> .env

elif [ "$contur" = "CITest" ]; then
  # shellcheck disable=SC2129
  echo CONTOUR=CITest >>.env
  echo API_ENTRYPOINT=./badges.sh >>.env
  echo API_SERVICE_REPORTS=/builds/GavrilovStepan01/AwesomeGitLab/reports >> .env

else
  echo No countur settings "$contur"
fi
