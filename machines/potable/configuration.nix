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
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # Command line goodies
    bat # file viewer
    fd # alternative to "find"
    file # determine file type
    fish # friendly shell
    fzf # fuzzy finder
    gitAndTools.gitFull
    htop # process viewer
    pv # pipe viewer
    ranger # file explorer
    ripgrep # find in file
    rlwrap # for shell that doesn't have readline (e.g. sbcl)
    screen # terminal multiplexer
    tig # text-mode interface for git
    tmux # terminal multiplexer
    tree # ls in tree-like format
    unzip
    w3m # terminal web browser
    wget # download stuff
  ] ++ [
    # Windows interop
    ntfs3g # In order to mount NTFS with rw
  ] ++ [
    # Editors
    emacs
    kakoune # alternative to vim
    vim
  ] ++ [
    # Diagnostic tools
    lsof # to find which process has which file opened
    usbutils # e.g. list usb devices
    bind # e.g. nslookup
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
    videoDrivers = [ "nvidia" ];
    layout = "us";
    # this is incompatible with gnome, but the trackpad doesn't work without it in with stumpwm, go figure
    synaptics.enable = true;
    exportConfiguration = true;
  };

  services.compton = {
    enable = true;

    shadow = true;
    shadowOpacity = "0.5";
    inactiveOpacity = "0.8";
    fade = true;
    fadeDelta = 5; # in ms, default is 10
  };

  # Use CapsLock as a compose key
  services.xserver.xkbOptions = "compose:caps";

  # Login screen
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = false; # because nvidia drivers doesn't support wayland
  };
  # services.xserver.displayManager.sddm.enable = true; # alternative (I've had problems with gdm)

  # Window/Desktop manager
  # services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.windowManager.stumpwm.enable = true;

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

  services.mpd = {
    enable = true;
    user = "mpsyco";
    group = "users";
    dataDir = "/home/mpsyco/mpd";
    extraConfig = ''
      audio_output {
        type "alsa"
        name "My ALSA Device"
        mixer_device "default"
        mixer_control "Master"
      }

      # disable "resume playback" on startup
      restore_paused "yes"
      '';
  };

  virtualisation.virtualbox.host.enable = true;
  virtualisation.docker.enable = true;
}
