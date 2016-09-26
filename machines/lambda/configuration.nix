# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Things that are specific to this computer.
      # TODO Move some things in there.
      ./local-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "lambda"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "America/Montreal";

  # For nvidia's proprietary drivers.
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    wget
    emacs
    firefox
    gitAndTools.gitFull
    mercurialFull
    libreoffice
    cmake
    gnumake
    screen
    sqlite
    # stumpwm-git
    rlwrap
    tree
    # vimHugeX
    xscreensaver
    zsh

    unzip

    ntfs3g # In order to mount NTFS with rw
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.videoDrivers = [ "nvidia" ];
  # hardware.opengl.driSupport32bit = true;
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.extraUsers.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };
  users.extraUsers.mpsyco = {
    isNormalUser = true;
    uid = 1000;
    createHome = true;
    extraGroups = [ "wheel" ];
  };

  # Install virtualbox
  virtualisation.virtualbox.host.enable = true;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.03";

}
