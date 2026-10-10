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
            mountOptions = [ "fmask=0077" "dmask=0077" ];
          };
        };
        root = {
          size = "20G";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
            mountOptions = [ "noatime" ];
          };
        };
        nix = {
          size = "50G";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/nix";
            mountOptions = [ "noatime" ];
          };
        };
        home = {
          size = "100%";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/home";
            mountOptions = [ "noatime" ];
          };
        };
      };
    };
  };
}
