# the NixOS manual is accessible by running ‘nixos-help’.

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  hardware.opengl.driSupport32Bit = true;
  # Install pulseaudio explicitly to have sound with stumpwm
  hardware.pulseaudio = {
    enable = true;
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

  # For nvidia's proprietary drivers.
  # nixpkgs.config.allowUnfree = true;

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
    usbutils
  ] ++ [
    # GUI stuff
    firefox
    vlc
    pavucontrol
  ];

  programs = {
    bash.enableCompletion = true;
    fish.enable = true;
    ssh.startAgent = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    # videoDrivers = [ "nvidia" ]; # disabled because it doesn't support wayland (which is enabled by gdm)
    layout = "us";
    # this is incompatible with gnome, but the trackpad doesn't work without it in with stumpwm, go figure
    synaptics.enable = true;
    exportConfiguration = true;
  };

  # Use CapsLock as a compose key
  services.xserver.xkbOptions = "compose:caps";

  # Login screen
  services.xserver.displayManager.gdm.enable = true;
  # services.xserver.displayManager.sddm.enable = true; # alternative (I've had problems with gdm)

  # Window/Desktop manager
  # services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.windowManager.stumpwm.enable = true;

  # Enable power management service
  services.tlp.enable = true;

  services.syncthing = {
    enable = true;
    user = "mpsyco";
    dataDir = "/home/mpsyco/.syncthing";
    openDefaultPorts = true;
  };

  users.defaultUserShell = "/run/current-system/sw/bin/fish";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.mpsyco = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [
      "dialout" # In order to access /dev/ttyUSBx for hardware dev.
      "wheel"
      "networkmanager"
      "power"
      "docker"
      "adbusers"
    ];
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "19.03";
  system.autoUpgrade = {
    enable = true;
    channel = https://nixos.org/channels/nixos-19.03;
  };

  services.emacs = {
    enable = true;
    install = true;
  };

  virtualisation.virtualbox.host.enable = true;
  virtualisation.docker.enable = true;
}
