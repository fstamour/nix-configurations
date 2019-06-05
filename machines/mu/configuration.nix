# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
# Include the results of the hardware scan.
  imports = [
    ./hardware-configuration.nix
  ];

# For nvidia graphic card drivers
  nixpkgs.config.allowUnfree = true;

# Enable PulseAudio.
  hardware.pulseaudio.enable = true;

# Use the gummiboot efi boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

# Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
# Provide Japanese Input. Why not?
    inputMethod.ibus.engines = [ pkgs.ibus-anthy pkgs.mozc ];
  };

# Set your time zone.
  time.timeZone = "America/Montreal";

# List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    screen
    gitAndTools.gitFull
    fish
    file
    moreutils # Sponge at least...
    tree
    vim
    w3m
    wget
  ] ++ [
    tmux
    ranger
    fd
    ripgrep
  ] ++ [
    lsof
    iotop
    htop
    pv
  ] ++ [
    firefox
    vlc
    pavucontrol
  ];

  environment.variables = {
    EDITOR = "vim";
  };

  programs = {
    bash.enableCompletion = true;
    fish.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark-gtk;
    };

    ssh = {
      startAgent = true;
    };
  };

# List services that you want to enable:

  services = {
# See https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix
    mpd = {
      enable = true;
# musicDirectory =
    };

# Enable the OpenSSH daemon.
    openssh = {
      enable = true;
      passwordAuthentication = false;
    };

# Windows share access
    samba = {
      enable = true;
      nsswins = true;
    };

# Synchting
    syncthing = {
      enable = true;
      user = "mpsyco";
      dataDir = "/home/mpsyco/.config/syncthing";
      openDefaultPorts = true;
    };
  };

# Network security
  networking.firewall.allowPing = true;
  networking.firewall.allowedTCPPorts = [ 445 139 7777 ];
  networking.firewall.allowedUDPPorts = [ 137 138 7777 ];

  networking.hostName = "mu"; # Define your hostname.
  networking.hostId = "D40F09C6";  # Random 32-bit identifier

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts
    dina-font
    proggyfonts
  ];

# Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.videoDrivers = [ "nvidia" ];
# services.xserver.xkbOptions = "eurosign:e";


  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.windowManager.stumpwm.enable = true;

  users.defaultUserShell = "/run/current-system/sw/bin/fish";

# Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.mpsyco = {
    createHome = true;
    home = "/home/mpsyco";
    isNormalUser = true;
    extraGroups = [
      "wheel" # Sudo rights
      "dialout" # In order to access /dev/ttyUSBx for hardware dev.
      "docker"
      "wireshark"
    ];
    uid = 1000;
  };

# The NixOS release to be compatible with for stateful data such as databases.
    system.stateVersion = "18.09";
    system.autoUpgrade = {
      enable = true;
      channel = https://nixos.org/channels/nixos-19.03;
    };

# Virtualisation
    virtualisation.libvirtd.enable = true;
    virtualisation.virtualbox.host.enable = true;
    virtualisation.docker.enable = true;

# For steam
    hardware.opengl.driSupport32Bit = true;
    hardware.pulseaudio.support32Bit = true;
}
