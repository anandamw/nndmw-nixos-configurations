{ config, pkgs, ... }:

{
  # Enable Docker system service
  virtualisation.docker.enable = true;

  # Optionally, enable rootless Docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # If Docker is enabled, make sure the user is part of the docker group
  users.users.nndmw.extraGroups = [ "docker" ];
}

