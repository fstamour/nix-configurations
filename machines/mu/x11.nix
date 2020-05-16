
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    anki # space-repetition something, I forgot...
    arandr # display layout tool
    calibre kindlegen # ebook tools
    chromium # shiny web browser
    copyq # clipboard manager
    dmenu # dynamic menu
    evince # document viewer
    firefox # foxy web browser
    freemind # mind map
    freerdp # remote desktop (gui)
    keepassx2 # password manager
    libreoffice # office suite
    lxappearance # tweak gtk theme (appearance)
    pavucontrol # audio control
    pavucontrol # sound settings
    shutter # for screenshots
    stumpish
    termite # terminal emulator
    vlc # media player
    wxcam # webcam
    xclip # manipulate the clipboard from the command line
    xlockmore # screen locker
    xorg.xev # print x event ids
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

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.windowManager.stumpwm.enable = true;
}
