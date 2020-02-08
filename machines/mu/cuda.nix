{ config, pkgs, ... }:

{
# CUDA
  systemd.services.nvidia-control-devices = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.ExecStart = "${pkgs.linuxPackages.nvidia_x11}/bin/nvidia-smi";
  };


  environment.systemPackages = with pkgs; [
    cudatoolkit
  ];
}
