{ config, pkgs, ... }:

{
  home.username = "nndmw";
  home.homeDirectory = "/home/nndmw";

  home.packages = with pkgs; [
  # archives
    zip
    xz
    unzip
    p7zip

    neofetch
    nnn # terminal file manager

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "anandamw";
    userEmail = "ananda.maulana.w@gmail.com";
  };


   # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

}
