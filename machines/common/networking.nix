{ config, pkgs, lib, ... }:

{
  # For development
  networking.hosts = {
	"192.168.0.10" = [ "kthanks.local" ]; # ethernet, static address (no dhcp)
	# "10.0.0.11" = [ "kthanks.local" ]; # wifi, static address (no dhcp)
  };
}
