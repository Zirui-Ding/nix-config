{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.xserver = {
    enable = true;
    xkb.layout = "jp";
    videoDrivers = [ "nvidia" ];
    desktopManager.xterm.enable = false;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    excludePackages = [ pkgs.xterm ];
  };

  hardware.graphics = {
    enable = true;
  };

  hardware.nvidia = {
    open = false;
 #   modesetting.enable = true;
 #   powerManagement.enable = false;
 #   powerManagement.finegrained = false;
 #   nvidiaSettings = true;
 #   forceFullCompositionPipeline = true;
 #   package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
  };

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    dconf-editor
    gnomeExtensions.just-perfection
    gnomeExtensions.kimpanel
    gnomeExtensions.system-monitor
  ];

  environment.gnome.excludePackages = (
    with pkgs;
    [
      gnome-photos
      gnome-tour
      gnome-music
      gnome-characters
      gnome-maps
      gnome-connections
      gnome-user-docs
      geary
      epiphany
      cheese
      gedit
      totem
    ]
  );

  home-manager.users.jerry = {
    dconf = {
      enable = true;
      settings."org/gnome/desktop/interface" = {
        text-scaling-factor = 1.25;
      };
      settings."org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
	  #kimpanel.extensionUuid
          system-monitor.extensionUuid
          just-perfection.extensionUuid
        ];
      };
    };
  };
}
