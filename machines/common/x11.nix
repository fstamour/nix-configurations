{ config, pkgs, ... }:
{
  hardware.opengl.enable = true;

  # Install pulseaudio explicitly to have sound with stumpwm
  hardware.pulseaudio = {
    enable = true;
    # for steam
    support32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    anki # space-repetition something, I forgot...
    arandr # display layout tool
    baobab # like WinDirStat for linux
    calibre # kindlegen # ebook tools
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
    mupdf # minimal pdf viewer + bunch of tools
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

  ## Keyboard
  services.xserver.layout = "us";
  # Use CapsLock as a compose key
  services.xserver.xkbOptions = "compose:caps";

  # services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.windowManager.stumpwm.enable = true;
  services.xserver.displayManager.defaultSession = "none+stumpwm";

  services.compton = {
    enable = true;
    shadow = true;
    shadowOpacity = 0.5;
    inactiveOpacity = 1.0;
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

