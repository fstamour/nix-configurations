{ config, pkgs, ... }:
{
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

      audio_output {
        type "pulse"
        name "My PULSE Device"
      }

      # disable "resume playback" on startup
      restore_paused "yes"

      mixer_type "software"
      '';
  };
}
