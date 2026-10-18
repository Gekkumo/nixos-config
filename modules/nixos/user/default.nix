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
  # NoCoW
  "d /var/lib/docker 0711 root root - +C"
  "d /var/lib/containers/storage 0700 root root - +C"
  "d /.podman 0700 ${username} users - +C"
  "d /.steam 0770 ${username} users - +C"
  "d /.wine 0770 ${username} users - +C"
  "d /.vm 0755 root libvirtd - +C"

  # Libvirt
  "d /var/lib/libvirt 0755 root root - -"
  "d /var/lib/libvirt/images 0755 root root - -"

  # Steam & Podman-rootless
  "d /home/${username}/.local/share/Steam 0770 ${username} users - -"
  "d /home/${username}/.local/share/containers/storage 0700 ${username} users - -"
];
}
