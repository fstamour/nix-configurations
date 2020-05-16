
{ config, pkgs, lib, ... }:

{
  hardware.opengl.enable = true;

  environment.systemPackages = with pkgs; [
    arandr
    calibre kindlegen
    dmenu
    firefox
    pavucontrol
    vlc
    xlockmore
  ];

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

  ## Keyboard
  services.xserver.layout = "us";
  # Use CapsLock as a compose key
  services.xserver.xkbOptions = "compose:caps";

  # services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.windowManager.stumpwm.enable = true;
  services.xserver.displayManager.defaultSession = "none+stumpwm";

  services.xserver.videoDrivers = [ "nvidia" ];

  # this is incompatible with gnome, but the trackpad doesn't work without it in with stumpwm, go figure
  services.xserver = {
    synaptics.enable = true;
    libinput.enable = false;
    exportConfiguration = true;
  };

  services.compton = {
    enable = true;
    shadow = true;
    shadowOpacity = "0.5";
    inactiveOpacity = "1.0";
    fade = true;
    fadeDelta = 5; # in ms, default is 10
    vSync = true;
  };

  # Login screen
  services.xserver.displayManager.gdm = {
     enable = true;
     wayland = false; # because nvidia drivers doesn't support wayland
  };
  # services.xserver.displayManager.sddm.enable = true; # alternative (I've had problems with gdm)
}
