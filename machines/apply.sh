#!/bin/sh

sudo rsync --include='*.nix' -rL $(hostname)/ /etc/nixos/
sudo nixos-rebuild switch

