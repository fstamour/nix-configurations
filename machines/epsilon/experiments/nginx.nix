{ pkgs, ... }
{
  environment.systemPackages = with pkgs; [
    samba # for smbpasswd and al.
  ];
  services.nginx = {
     enable = true;
     virtualHosts = {
       "epsilon.local" = {
          root = "/var/www/epsilon";
       };
     };
  };
  networking.firewall.allowedTCPPorts = [ 80 ];
}
