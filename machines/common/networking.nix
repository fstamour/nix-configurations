{ config, pkgs, lib, ... }:

{
  # For development
  networking.hosts = {
	"192.168.0.10" = [ "kthanks.local" ]; # ethernet, static address (no dhcp)
	# "192.168.0.50" = [ "kthanks.local" ]; # wifi, static address (no dhcp)
	"192.168.0.105" = [ "gamma.local" ]; # wifi, static dhcp address
  };
}

