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
            subvolumes = {
              "@" = {
                mountpoint = "/";
                mountOptions = [ "compress=zstd:1" "ssd" "noatime" ];
              };
              "@nix" = {
                mountpoint = "/nix";
                mountOptions = [ "compress=zstd:1" "ssd" "noatime" ];
              };
              "@home" = {
                mountpoint = "/home";
                mountOptions = [ "compress=zstd:1" "ssd" "noatime" ];
              };
              "@docker" = {
                mountpoint = "/var/lib/docker";
                mountOptions = [ "nodatacow" "ssd" "noatime" ];
              };
              "@steam" = {
                mountpoint = "/.steam";
                mountOptions = [ "nodatacow" "ssd" "noatime" ];
              };
              "@wine" = {
                mountpoint = "/.wine";
                mountOptions = [ "nodatacow" "ssd" "noatime" ];
              };
              "@vm" = {
                mountpoint = "/.vm";
                mountOptions = [ "nodatacow" "ssd" "noatime" ];
              };
              "@swap" = {
                mountpoint = "/.swap";
                mountOptions = [ "nodatacow" "ssd" "noatime" ];
                swap.swapfiles."swapfile" = {
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
