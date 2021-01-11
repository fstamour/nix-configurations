# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  # For development
  networking.hosts = {
#	"192.168.0.10" = [ "kthanks.local" ]; # ethernet, static address (no dhcp)
	"192.168.0.50" = [ "kthanks.local" ]; # wifi, static address (no dhcp)
	"192.168.0.112" = [ "gamma.local" ]; # wifi, static dhcp address
  };
}

