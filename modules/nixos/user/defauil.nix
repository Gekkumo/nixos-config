{ pkgs, inputs, username, ... }:
{
  users.users.${username} = {
    isNormalUser = true;
    description = "Gekkumo";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "libvirtd"
      "kvm"
      "audio"
      "realtime"
      "video"
    ];

    # sudo passwd gekkumo
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    extraSpecialArgs = { inherit inputs username; };

    users.${username} = {
      imports = [ ../../modules/home ];

      home = {
        username = username;
        homeDirectory = "/home/${username}";
        stateVersion = "26.05";
      };

      programs.home-manager.enable = true;
    };
  };
}