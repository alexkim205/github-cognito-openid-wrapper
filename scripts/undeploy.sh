#!/bin/bash -eu

STAGE=$1

if [ ! -f "$PROJECT_ROOT/config.$STAGE.sh" ]; then
  echo "ERROR: config.$STAGE.sh is missing. Copy example-config.sh and modify as appropriate."
  echo "   cp example-config.sh config.$STAGE.sh"
  exit 1
fi
source ./config.$STAGE.sh

aws cloudformation delete-stack --stack-name "$STACK_NAME"
