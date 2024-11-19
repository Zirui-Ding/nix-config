{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    neovim
    nixfmt-rfc-style
    w3m
    wget
  ];

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "gentoo";
    };
  };

  users.defaultUserShell = pkgs.zsh;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
