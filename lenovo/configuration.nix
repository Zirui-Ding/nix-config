{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./user.nix
    ./stylix.nix
    ./software.nix
    ./gnome.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
      font = "${pkgs.hack-font}/share/fonts/truetype/Hack-Regular.ttf";
      fontSize = 24;
    };
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Tokyo";

  i18n.defaultLocale = "en_US.UTF-8";
  console = { keyMap = "jp106"; };

  services.printing = {
    enable = true;
    drivers = [ pkgs.brlaser ];
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system (/run/current-system/configuration.nix)
  # system.copySystemConfiguration = true;

  # DO NOT CHANGE IT!
  system.stateVersion =
    "24.05"; # Did you read the comment? (Sorry I deleteed it.)
}

