#!/bin/sh

# make sure there aren't any pending changes in the repository
git diff-index --quiet HEAD -- || \
       	(echo "Please take care of any changes in the repository." && exit)

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

# just to make stuff shorter
hard=hardware-configuration.nix
for machine in epsilon mu; do
  header $machine
  if [ $machine = $(hostname) ]; then
	  run cp -r $(find /etc/nixos/ -name '*.nix' | \
		  grep -v $hard) $machine/
  else
    run rsync --exclude=$hard -vr ${machine}:/etc/nixos/ ${machine}/
  fi
done

header git status
git status
