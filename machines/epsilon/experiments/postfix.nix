{ pkgs, ... }:

{
  services.postfix = {
    enable = true;
    enableSubmission = true;
  };

  networking.firewall.allowedTCPPorts = [ 25 ];
}
