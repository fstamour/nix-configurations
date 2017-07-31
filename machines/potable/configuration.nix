# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  hardware.opengl.driSupport32Bit = true;

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

  networking.hostName = "potable"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "America/Montreal";

  # For nvidia's proprietary drivers.
  nixpkgs.config.allowUnfree = true;

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
    unzip
    wget
    zsh 
  ] ++ [
    # Windows interop
    ntfs3g # In order to mount NTFS with rw
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
    vlc
    pavucontrol
  ];

  programs = {
    bash.enableCompletion = true;
    zsh.enable = true;
    fish.enable = true;
    ssh.startAgent = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    layout = "us";
    synaptics = {
      enable = true;
    };
    exportConfiguration = true;
  };
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;
  # services.xserver.desktopManager.xfce.enable = true;
  services.xserver.windowManager.stumpwm.enable = true;

  # Enable power management service
  services.tlp.enable = true;

  users.defaultUserShell = "/run/current-system/sw/bin/fish";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.mpsyco = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.09";
  system.autoUpgrade.enable = true;


  services.emacs = {
    enable = true;
    install = true;
  };

  virtualisation.virtualbox.host.enable = true;
}
