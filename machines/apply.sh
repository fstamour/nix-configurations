#!/bin/sh

set -e
set -u

sudo rsync --include='*.nix' -rL $(hostname)/ /etc/nixos/
sudo nixos-rebuild switch

