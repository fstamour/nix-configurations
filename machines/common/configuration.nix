# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports = [
    ./networking.nix
    ./packages.nix
    ./x11.nix
    # ./others.nix
    ./printer.nix
  ];

  # For development
  networking.firewall.allowedTCPPorts = [ 8000 8080 ];

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
      forwardX11 = true;
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

  environment.variables = {
    EDITOR = "emacsclient -c -a emacs";
  };

  environment.systemPackages = with pkgs; [
    # Specific to "mu"
    refind # efi boot loader
  ];

  environment.homeBinInPath = true;

  programs = {
    bash.enableCompletion = true;
    fish.enable = true;
    ssh = {
      startAgent = true;
    };
    mosh.enable = true;
  };

  users.defaultUserShell = "/run/current-system/sw/bin/fish";

  users.groups = {
    # On Arch Linux the group uucp is used for "Serial and USB devices
    # such as modems, handhelds, RS-232/serial ports"
    uucp = {};
  };

  services.udev.extraRules = ''
    # Set group for USBTinyISP
    SUBSYSTEM=="usb", ATTRS{idVendor}=="1781", ATTRS{idProduct}=="0c9f", GROUP="uucp"
  '';

# Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.mpsyco = {
    createHome = true;
    home = "/home/mpsyco";
    isNormalUser = true;
    extraGroups = [
      "adbusers" # android develpment
      "cdrom" # for burning cd
      "dialout" # In order to access /dev/ttyUSBx for hardware dev.
      "docker"
      "lp" # printer
      "lxd"
      "networkmanager"
      "power"
      "scanner"
      "wheel" # sudoer
      "wireshark"
      "uucp" # for USBTinyISP
    ];
    uid = 1000;
  };

# Virtualisation
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.lxd.enable = true;
  virtualisation.virtualbox.host.enable = true;

# Allow _some_ unfree package
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    # "factorio"
    # "factorio-headless"
    # "kindlegen"
    "nvidia-x11"
    "nvidia-settings"
    "nvidia-persistenced"
    # "cudatoolkit"
    "android-studio-stable"
    # "discord"
    "steam"
    "steam-original"
    "steam-runtime"
    # "teamviewer"
  ];

  # because some things are more up-to-date when using flatpak
  # like anki and steam
  services.flatpak.enable = true;
}
