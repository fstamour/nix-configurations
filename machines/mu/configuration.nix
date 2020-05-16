# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
# Include the results of the hardware scan.
  imports = [
    ./hardware-configuration.nix
    ./cuda.nix
    ./packages.nix
    ./common/x11.nix
  ];

# For nvidia graphic card drivers
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];

# Enable PulseAudio.
  hardware.pulseaudio.enable = true;

# Use the gummiboot efi boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    resumeDevice = "/swapfile";
  };

# Enable support for SANE scanners
  hardware.sane.enable = true;

# Configure console
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

# Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
# Provide Japanese Input. Why not?
    inputMethod.ibus.engines = [ pkgs.ibus-anthy pkgs.mozc ];
  };

# Set your time zone.
  time.timeZone = "America/Montreal";


# List services that you want to enable:
  services = {
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
  networking.firewall.allowedTCPPorts = [
    # smb & netbiod
    445 139
    # steam
    7777
    # for web development
    8080
  ];
  networking.firewall.allowedUDPPorts = [
    # netbios
    137 138
    # steam
    7777
  ];

  networking.hostName = "mu"; # Define your hostname.
  networking.hostId = "D40F09C6";  # Random 32-bit identifier

  environment.variables = {
    EDITOR = "vim";
  };

  environment.homeBinInPath = true;

  programs = {
    bash.enableCompletion = true;
    fish.enable = true;
    ssh = {
      startAgent = true;
    };
  };

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
      "cdrom" # for burning cd
      "scanner"
      "lp" # printer
    ];
    uid = 1000;
  };

# The NixOS release to be compatible with for stateful data such as databases.
    system.stateVersion = "18.09";
    system.autoUpgrade = {
      enable = true;
      channel = https://nixos.org/channels/nixos-20.03;
    };

# Virtualisation
    virtualisation.libvirtd.enable = true;
    virtualisation.virtualbox.host.enable = true;
    virtualisation.docker.enable = true;

# For steam
    hardware.opengl.driSupport32Bit = true;
    hardware.pulseaudio.support32Bit = true;
}

