#!/bin/bash -eu
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"  # Figure out where the script is running
. "$SCRIPT_DIR"/lib-robust-bash.sh # load the robust bash library
PROJECT_ROOT="$SCRIPT_DIR"/.. # Figure out where the project directory is

STAGE=$1

if [ ! -f "$PROJECT_ROOT/config.$STAGE.sh" ]; then
  echo "ERROR: config.$STAGE.sh is missing. Copy example-config.sh and modify as appropriate."
  echo "   cp example-config.sh config.$STAGE.sh"
  exit 1
fi
source ./config.$STAGE.sh

aws cloudformation delete-stack --stack-name "$STACK_NAME"
