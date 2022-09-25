#!/usr/bin/env bash

set -e

print_msg() {
  local tag="$1"
  local msg="$2"

  echo "$(date +'%y%m%d-%H%M%S') [$tag] $msg"
}

run() {
  print_msg "CMD" "$*"
  $@ &> /dev/null
}

info() { local msg="$1"; print_msg INFO "$msg"; }
error() { local msg="$1"; pring_msg ERROR "$msg"; }
error() { local msg="$1"; error "$msg"; exit 1; }


info 'Update & Upgrade'

run apt-get update -y || die 'Unable to update packages'
run apt-get install -q -y g++ make git || die 'Unable to install necessary packages'

info 'Done'
