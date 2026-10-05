{ disks, ... }:
{
  disko.devices.disk.main = {
    device = disks.main;
    type = "disk";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          size = "550M";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };
        root = {
          size = "100%";
          content = {
            type = "btrfs";
            extraArgs = [ "-f" ];
            subvolumes = {
              "/root" = {
                mountpoint = "/";
                mountOptions = [ "compress=zstd" "subvol=root" ];
              };
              "/home" = {
                mountpoint = "/home";
                mountOptions = [ "compress=zstd" "subvol=home" ];
              };
              "/nix" = {
                mountpoint = "/nix";
                mountOptions = [ "compress=zstd" "noatime" "subvol=nix" ];
              };
              "/swap" = {
                mountpoint = "/swap";
                mountOptions = [ "noatime" "subvol=swap" ];
              };
            };
          };
        };
      };
    };
  };
}
