{
  network.description = "Jenkins Continuous integration server";

  jenkins = { config, pkgs, ... }: {
    services.jenkins = {
      enable = true;
      listenAddress = "0.0.0.0";
      port = 8080;
    };
    fileSystems."/data" = { fsType = "nfs4"; device = "fileserver:/"; };
    networking.firewall.allowedTCPPorts = [ 80 8080 ]; 
  };

  fileserver = { config, pkgs, ... }: {
    services.nfs.server.enable = true;
    services.nfs.server.exports = "...";
  };

#  kerberos = { config, pkgs, ... }: {
#    services.kerberos_server = {
#      enable = true;
#    };
#  };
}
