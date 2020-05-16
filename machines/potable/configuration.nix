# the NixOS manual is accessible by running ‘nixos-help’.

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./common/x11.nix
      ./x11-potable.nix
      ./mpd.nix
    ];

  # for steam
  # hardware.opengl.driSupport32Bit = true;

  # Install pulseaudio explicitly to have sound with stumpwm
  hardware.pulseaudio = {
    enable = true;
    # for steam
    support32Bit = true;
  };

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
  networking.networkmanager.enable = true;

  # For development
  networking.firewall.allowedTCPPorts = [ 8000 ];

  # Set your time zone.
  time.timeZone = "America/Montreal";

  environment.homeBinInPath = true;

  programs = {
    bash.enableCompletion = true;
    fish.enable = true;
    ssh.startAgent = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable power management service
  services.tlp.enable = true;

  services.syncthing = {
    enable = true;
    user = "mpsyco";
    configDir = "/home/mpsyco/.syncthing";
    openDefaultPorts = true;
  };

  users.defaultUserShell = "/run/current-system/sw/bin/fish";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.mpsyco = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [
      "dialout" # In order to access /dev/ttyUSBx for hardware dev.
      "wheel" # sudoer
      "networkmanager"
      "power"
      "docker"
      "lxd"
      "adbusers" # android develpment
    ];
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "19.03";
  system.autoUpgrade = {
    enable = true;
    channel = https://nixos.org/channels/nixos-20.03;
  };

  services.emacs = {
    enable = true;
    install = true;
  };

  # Not tested yet
  # config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "factorio"
    "factorio-headless"
    "kindlegen"
    # "nvidia-x11-440.82-5.4.35"
    "nvidia-x11"
    "nvidia-settings"
    "nvidia-persistenced"
  ];
  services.factorio = {
    enable = true;
  };

  virtualisation.virtualbox.host.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.lxd.enable = true;
}
