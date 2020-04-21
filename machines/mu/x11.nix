
{ config, pkgs, ... }:

{
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
  services.xserver.layout = "us";
  services.xserver.videoDrivers = [ "nvidia" ];

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.windowManager.stumpwm.enable = true;
}
