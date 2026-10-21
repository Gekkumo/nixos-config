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

  systemd.services.chattr-nocow = {
    description = "Set No_COW on Btrfs subvolumes";
    wantedBy = [ "multi-user.target" ];
    after = [ "local-fs.target" ];
    before = [
      "docker.service"
      "podman.service"
    ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    path = [ pkgs.e2fsprogs ];
    script = ''
      for dir in /.steam /.wine /.vm /.podman /var/lib/docker /var/lib/containers/storage /home/${username}/.local/share/Steam /home/${username}/.local/share/containers/storage; do
        if [ -d "$dir" ] && [ -z "$(ls -A "$dir" 2>/dev/null)" ]; then
          chattr +C "$dir"
        fi
      done
    '';
  };

  systemd.tmpfiles.rules = [
    # Fix ruls
    "d /var/lib/docker 0711 root root - -"
    "d /var/lib/containers/storage 0700 root root - -"
    "d /.podman 0700 ${username} users - -"
    "d /.steam 0770 ${username} users - -"
    "d /.wine 0770 ${username} users - -"
    "d /.vm 0755 root libvirtd - -"

    # Libvirt
    "d /var/lib/libvirt 0755 root root - -"
    "d /var/lib/libvirt/images 0755 root root - -"

    # Steam & Podman-rootless
    "d /home/${username}/.local 0755 ${username} users - -"
    "d /home/${username}/.local/share 0755 ${username} users - -"
    "d /home/${username}/.local/share/Steam 0770 ${username} users - -"
    "d /home/${username}/.local/share/containers 0700 ${username} users - -"
    "d /home/${username}/.local/share/containers/storage 0700 ${username} users - -"
  ];
}
