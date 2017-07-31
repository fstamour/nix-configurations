# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "vinix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "America/Montreal";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # Command line goodies
    screen
    gitAndTools.gitFull
    file
    fish
    htop
    rlwrap
    tmux
    tree
    ranger
    wget
  ] ++ [
    # Editors
    emacs
    kakoune
    vim
  ] ++ [
    # Diagnostic tools
    lsof
  ] ++ [
    # GUI stuff
    firefox
    dmenu
    termite
    xscreensaver
  ];

  programs = {
    bash.enableCompletion = true;
    fish.enable = true;
    ssh.startAgent = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";

  # Enable the KDE Desktop Environment.
  services.xserver.windowManager.stumpwm.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.fstamour = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "power" ];
  };

  # Default shell is fish
  users.defaultUserShell = "/run/current-system/sw/bin/fish";

  virtualisation.virtualbox.guest.enable = true;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}
