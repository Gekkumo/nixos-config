{
  pkgs,
  inputs,
  username,
  pkgsUnstable,
  hostName,
  ...
}:
{
  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "libvirtd"
      "kvm"
      "i2c"
      "audio"
      "realtime"
      "video"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {
      inherit
        inputs
        username
        pkgsUnstable
        hostName
        ;
    };

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

  systemd.tmpfiles.rules = [
    # Fix after Disko
    "z /.wine 0770 ${username} users - -"
    "z /.steam 0770 ${username} users - -"
    "z /.vm 0770 root libvirtd - -"

    "d /home/${username} 0700 ${username} users - -"

    # Home Manager & Steam
    "d /home/${username}/.local 0755 ${username} users - -"
    "d /home/${username}/.local/share 0755 ${username} users - -"
    "d /home/${username}/.local/share/Steam 0770 ${username} users - -"
    "z /home/${username}/.local 0755 ${username} users - -"
    "z /home/${username}/.local/share 0755 ${username} users - -"
    "z /home/${username}/.local/share/Steam 0770 ${username} users - -"

    # Podman (rootless)
    "d /home/${username}/.local/share/containers 0700 ${username} users - -"
    "d /home/${username}/.local/share/containers/storage 0700 ${username} users - -"
    "z /home/${username}/.local/share/containers 0700 ${username} users - -"
    "z /home/${username}/.local/share/containers/storage 0700 ${username} users - -"

    # Libvirt
    "d /var/lib/libvirt 0755 root root - -"
    "d /var/lib/libvirt/images 0711 root root - -"
  ];
}
