networking.firewall.allowedTCPPorts = [ 80 ];
services.nginx = {
  enable = true;
  virtualHosts = {
    "yourdomain.com" = {
      root = "/var/www/yourdomain";
    };
  };
};
