{ config, lib, pkgs, ... }:

{
  users.users.jerry = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  security.sudo.extraRules = [{
    users = [ "jerry" ];
    commands = [{
      command = "ALL";
      options =
        [ "NOPASSWD" ];
    }];
  }];
}
