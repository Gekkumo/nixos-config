{ pkgs, inputs, username, pkgsUnstable, ... }:
{

  users.groups.plugdev = {
    gid = 899;
  };

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
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    extraSpecialArgs = { inherit inputs username pkgsUnstable; };

    users.${username} = {
      imports = [ ../../home ];

      home = {
        username = username;
        homeDirectory = "/home/${username}";
        stateVersion = "26.05";
      };

      programs.home-manager.enable = true;
    };
  };
}