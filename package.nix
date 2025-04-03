{ config, pkgs, ... }:

let
  # Import PHP configuration
  phpConfig = import ./modules/php/php-config.nix { inherit pkgs; };
in
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow unfree packages in unstable channel
  nixpkgs.config.packageOverrides = pkgs: {
    unstable = import <unstable> {
      inherit (pkgs) system;
      config.allowUnfree = true;
    };
  };

  # List of system packages to be installed
  environment.systemPackages = with pkgs; [
    # Communication and collaboration tools
    zoom-us
    discord
    anydesk
    zotero
    postman
    genymotion

    # Development tools
    git
    neovim
    vscode
    curl
    wget
    fastfetch
    nodejs_22
    php.packages.composer
    phpConfig.php83

    # System utilities and performance monitoring
    neofetch
    speedtest-cli
    obs-studio
    gnome-shell-extensions
    gnome-tweaks
    vlc
    blender
    docker-client
    docker_26
    # Office and productivity tools
    gedit
    libreoffice
    drawio

    # Browser and web tools
    google-chrome

    # Other utilities
    gimp
  ];

  # Additional system configurations can go here
}

