# the NixOS manual is accessible by running ‘nixos-help’.

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./common/configuration.nix
      ./x11-potable.nix
      ./mpd.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub = {
    enable = true;
    version = 2;
    # Define on which hard drive you want to install Grub.
    device = "/dev/sda"; # or "nodev" for efi only
    extraEntries = ''
      menuentry "Windows 10" {
        set root='(hd0,msdos1)'
        chainloader +1
      }
    '';
  };

# Networking
  networking.hostName = "potable"; # Define your hostname.
  networking.networkmanager.enable = true;

  programs = {
    bash.enableCompletion = true;
    fish.enable = true;
    ssh.startAgent = true;
  };

  # Enable power management service
  services.tlp.enable = true;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "19.03";


}
