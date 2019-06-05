#!/bin/sh

# make sure there aren't any pending changes in the repository
git diff-index --quiet HEAD -- || (echo "Please take care of any changes in the repository." && exit)

function run() {
  echo $*
  $*
}

function header() {
  echo
  echo ===================================================
  echo $*
  echo ===================================================
}

for machine in epsilon mu potable; do
  header $machine
  if [ $machine = $(hostname) ]; then
    run cp /etc/nixos/configuration.nix $machine
  else
    run rsync -vr ${machine}:/etc/nixos/ ${machine}/
  fi
done

header git status
git status
