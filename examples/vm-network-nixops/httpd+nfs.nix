{
  network.description = "Web server + NFS";

  webserver = { config, pkgs, ... }: {
    
    services.httpd = {
      enable = true;
      documentRoot = "/data";
      adminAddr = "admin@example.com";
    };
    fileSystems."/data" = { fsType = "nfs4"; device = "fileserver:/"; };
    networking.firewall.allowedTCPPorts = [ 80 ]; 
  };

  fileserver = { config, pkgs, ... }: {
    services.nfs.server.enable = true;
    services.nfs.server.exports = "...";
  };
}
