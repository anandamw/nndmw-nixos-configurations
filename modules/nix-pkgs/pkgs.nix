{ config, pkgs, ... }:

{


  

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  nixpkgs.config.packageOverrides = pkgs: {
    unstable = import <unstable> {
      inherit (pkgs) system;
      config.allowUnfree = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  wget
  neovim
  curl
  vscode
  google-chrome
  anydesk
  git
  php.packages.composer
  #php82
  php83
  nodejs_22
  zotero
  discord
  neofetch
  postman
  speedtest-cli
  obs-studio
  gnome-shell-extensions
  gnome-tweaks
  vlc
  blender
  gedit
  libreoffice
  drawio
 ];
}









