{ pkgs, ... }:

{
  php83 = pkgs.php83.buildEnv {
    extensions = ({ enabled, all }: enabled ++ (with all; [
      apcu
      bcmath
      gmp
      imagick
      opcache
      pdo
      pdo_pgsql
      redis
    ]));
    extraConfig = ''
      apc.enable_cli = 1
    '';
  };
}

