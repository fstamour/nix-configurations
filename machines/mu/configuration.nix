# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
# Include the results of the hardware scan.
  imports = [
    ./hardware-configuration.nix
    ./common/configuration.nix
    # ./cuda.nix
  ];

# Use the gummiboot efi boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

# Networking
  networking.firewall.allowPing = true;
  networking.firewall.allowedTCPPorts = [
    # smb & netbiod
    445 139
    # steam
    7777
    # for web development
    8080
    # for myelin
    4242
  ];
  networking.firewall.allowedUDPPorts = [
    # netbios
    137 138
    # steam
    7777
  ];

  networking.hostName = "mu"; # Define your hostname.
  networking.hostId = "D40F09C6";  # Random 32-bit identifier

# For nvidia graphic card drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;


# Enable support for SANE scanners
  hardware.sane.enable = true;

# # Don't turn off the screen
#   environment.extraInit = ''
#     if [[ ! $(tty >/dev/null) ]] && [ -n "$DISPLAY" ] ; then
#       xset s off -dpms
#     fi
#   '';

# The NixOS release to be compatible with for stateful data such as databases.
    system.stateVersion = "18.09";

# For steam
    hardware.opengl.driSupport32Bit = true;
    hardware.pulseaudio.support32Bit = true;
}
