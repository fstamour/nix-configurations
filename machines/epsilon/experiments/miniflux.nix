{ config, pkgs }
{
   # Interesting, but not available in 19.03 (is on the master branch tho)
   services.miniflux = {
     enable = true;
     config = {
       adminCredentialsFile = "/etc/nixos/miniflux-admin-credentials";
       LISTEN_ADDR = "0.0.0.0:80";
     };
   };
}
