{ config, pkgs, inputs, ... }:
{
  users.users.gekkumo = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    # Пароль: sudo passwd gekkumo
  };

  home-manager.users.gekkumo = {
    imports = [
      ../home/default.nix
      ../home/packages-common.nix
      inputs.noctalia.homeModules.default
    ];

  programs.noctalia = {
    enable = true;
    settings = {
      # change
    };
  };

    home.stateVersion = "26.05";
  };
}