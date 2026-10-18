{ disks, ... }:
{
  disko.devices.disk.main = {
    device = disks.main;
    type = "disk";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          priority = 1;
          name = "ESP";
          start = "1MiB";
          end = "550MiB";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "fmask=0077" "dmask=0077" ];
          };
        };
        root = {
          size = "100%";
          content = {
            type = "btrfs";
            extraArgs = [ "-f" ];
            postMountCommands = ''
              chattr +C /mnt/var/lib/docker
              chattr +C /mnt/var/lib/containers/storage
              chattr +C /mnt/.podman
              chattr +C /mnt/.steam
              chattr +C /mnt/.wine
              chattr +C /mnt/.vm
            '';
            subvolumes = {
              "@" = {
                mountpoint = "/";
                mountOptions = [ "compress=zstd:1" "ssd" "noatime" ];
              };
              "@nix" = {
                mountpoint = "/nix";
              };
              "@home" = {
                mountpoint = "/home";
              };
              "@docker" = {
                mountpoint = "/var/lib/docker";
              };
              "@podman" = {
                mountpoint = "/var/lib/containers/storage";
              };
              "@podman-rootless" = {
                mountpoint = "/.podman";
              };
              "@steam" = {
                mountpoint = "/.steam";
              };
              "@wine" = {
                mountpoint = "/.wine";
              };
              "@vm" = {
                mountpoint = "/.vm";
              };
              "@swap" = {
                mountpoint = "/.swap";
                swap.swapfile = {
                  size = "8G";
                };
              };
            };
          };
        };
      };
    };
  };
}
