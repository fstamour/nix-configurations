{ config, pkgs, ... }:

{
networking.extraHosts =
  ''
    192.168.0.150 anas
    192.168.0.150 sparkacid.com
  '';
}


