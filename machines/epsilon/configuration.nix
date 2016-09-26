# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Enable PulseAudio.
  hardware.pulseaudio.enable = true;

  # Use the gummiboot efi boot loader.
  boot.loader.gummiboot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "zfs" ];

  networking.hostName = "epsilon"; # Define your hostname.
  networking.hostId = "D40F09C5";  # Random 32-bit identifier

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
     git
     fish
     tree
     vim
     wget
     zsh
  ] ++ [
    # Diagnostic tools
    lsof
  ] ++ [
    # GUI stuff
    firefox
    vlc
    pavucontrol
  ];

  programs = {
    bash.enableCompletion = true;
    zsh.enable = true;
    fish.enable = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm = {
  enable = true;
    autoLogin = {
      enable = true;
      user = "shared";
    };
  };

  services.xserver.desktopManager.kde5 = {
    enable = true;
  };
  # services.xserver.desktopManager.gnome3.enable = true;

  users.defaultUserShell = "/run/current-system/sw/bin/fish";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.mpsyco = {
    createHome = true;
    home = "/home/mpsyco";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    uid = 1000;
  };

  users.extraUsers.shared = {
    createHome = true;
    home = "/home/shared";
    isNormalUser = true;
    uid = 1001;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";

}
