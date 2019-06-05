{ pkgs, ... }:
{
  # Enable samba server
  services.samba = {
  enable = true;
  enableNmbd = true;
  shares = {
    data ={
      path = "/share/";
      "read only" = "no";
      # "read only" = "yes";
      browseable = "yes";
      "valid users" = "shared";
      # "guest ok" = "yes";
    };
  };
  extraConfig = ''
  # guest account = shared
  map to guest = bad user
  log level = 3;
  workgroup = WORKGROUP;
  '';
  };
  # https://www.grc.com/port_137.htm
  # port 137 => netbios-ns (name service)
  # port 138 => netbios-dgm (datagram service)
  # port 139 => netbios-ssn (session service)
  # port 445 => microsoft-ds (microsoft directory services, part of samba)
  networking.firewall.allowedTCPPorts = [ 137 138 139 ] ++ [ 445 ];
  networking.firewall.allowedUDPPorts = [ 137 138 ];
}
