{ config, lib, pkgs, inputs, ... }:

{
  stylix.enable = true;
  stylix.targets.grub.enable = false;
  stylix.image = pkgs.fetchurl {
    url =
      "https://www.pixelstalk.net/wp-content/uploads/images5/Blue-Windows-11-Wallpaper-4K-scaled.jpg";
    sha256 = "kYGlP9/3eNKzJwPzWiwanJzR/XZjZouVgNg+Cm0/dRY=";
  };

  stylix.base16Scheme =
    "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  
  stylix.fonts = {
    serif = {
      package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro;
      name = "SFProDisplay";
    };
    sansSerif = {
      package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro;
      name = "SFProDisplay";
    };
    monospace = {
      package = pkgs.dejavu_fonts;
      name = "JetBrainsMono Nerd Font";
    };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };

  fonts.packages = with pkgs; [
    hack-font
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    fira-code
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  boot.loader.grub = {
    font = "${pkgs.hack-font}/share/fonts/truetype/Hack-Regular.ttf";
    fontSize = 24;
  };
}
