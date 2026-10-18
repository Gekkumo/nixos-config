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
            mountOptions = [
              "fmask=0077"
              "dmask=0077"
            ];
          };
        };
        root = {
          size = "100%";
          content = {
            type = "btrfs";
            extraArgs = [ "-f" ];
            subvolumes = {
              "@" = {
                mountpoint = "/";
                mountOptions = [
                  "compress=zstd:1"
                  "noatime"
                ];
              };
              "@nix" = {
                mountpoint = "/nix";
                mountOptions = [ "noatime" ];
              };
              "@home" = {
                mountpoint = "/home";
                mountOptions = [ "noatime" ];
              };
              "@docker" = {
                mountpoint = "/var/lib/docker";
                mountOptions = [ "noatime" ];
              };
              "@podman" = {
                mountpoint = "/var/lib/containers/storage";
                mountOptions = [ "noatime" ];
              };
              "@podman-rootless" = {
                mountpoint = "/.podman";
                mountOptions = [ "noatime" ];
              };
              "@steam" = {
                mountpoint = "/.steam";
                mountOptions = [ "noatime" ];
              };
              "@wine" = {
                mountpoint = "/.wine";
                mountOptions = [ "noatime" ];
              };
              "@vm" = {
                mountpoint = "/.vm";
                mountOptions = [ "noatime" ];
              };
              "@swap" = {
                mountpoint = "/.swap";
                mountOptions = [ "noatime" ];
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
