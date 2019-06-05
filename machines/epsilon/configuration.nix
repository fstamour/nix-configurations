# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nix.useSandbox = true;

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./samba.nix
    ];

  # Enable PulseAudio.
  hardware.pulseaudio.enable = true;

  # Legacy boot with grub2
  boot.loader.grub = {
    enable = true;
    version = 2;
    device =  "/dev/sda";
  };
  boot.supportedFilesystems = [ "zfs" ];

  networking.hostName = "epsilon"; # Define your hostname.
  networking.hostId = "D40F09C5";  # Random 32-bit identifier
  networking.firewall.allowPing = true;

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "America/Montreal";

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
     bat
     file
     git
     less
     screen
     tmux
     tree
     vim
     wget
  ] ++ [
    lsof
    iotop
    htop
  ];

  programs = {
    bash.enableCompletion = true;
    fish.enable = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };

  services.syncthing = {
    enable = true;
    user = "mpsyco";
    # configDir = "/home/mpsyco/.config/syncthig";
    dataDir = "/home/mpsyco/.config/syncthing";
    openDefaultPorts = true;
  };

  users.defaultUserShell = "/run/current-system/sw/bin/fish";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.mpsyco = {
    createHome = true;
    home = "/home/mpsyco";
    isNormalUser = true;
    extraGroups = [ "wheel" "power" ];
    uid = 1000;
  };

  users.extraUsers.shared = {
    createHome = true;
    home = "/home/shared";
    isNormalUser = true;
    uid = 1001;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "18.03";
}

