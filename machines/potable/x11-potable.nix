{ config, pkgs, ... }:
{
  # For nvidia graphic card drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # this is incompatible with gnome, but the trackpad doesn't work without it in with stumpwm, go figure
  services.xserver = {
    synaptics.enable = true;
    libinput.enable = false;
    exportConfiguration = true;
  };
}
