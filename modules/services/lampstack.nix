{ config, pkgs, lib, ... }:
let
  nixos-21_05 = import (builtins.fetchTarball {
    name = "nixos-21_05-2022-01-15";
    url = "https://github.com/nixos/nixpkgs/archive/0fd9ee1aa36ce865ad273f4f07fdc093adeb5c00.tar.gz";
    sha256 = "1mr2qgv5r2nmf6s3gqpcjj76zpsca6r61grzmqngwm0xlh958smx";
  }) {};
in
{
  # OPEN ON PORT 
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  # HTTPD
  services.httpd.enable = true;
  services.httpd.package = pkgs.apacheHttpd;

  # PHP
  services.httpd.enablePHP = true;
  services.httpd.phpPackage = pkgs.php;

  # MYSQL 
  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;

  # SETTING VIRTUALHOSTS
  services.httpd.virtualHosts = {
    localhost = {
      documentRoot = "/var/www/html";

      extraConfig = ''
        <Directory "/">
          DirectoryIndex index.html index.php
        </Directory>
      '';
    };
  };
}
