{ ... }:
{
  boot.zswap = {
    enable = true;
    compressor = "zstd";
    maxPoolPercent = 25;
    shrinkerEnabled = true;
  };

  boot.kernel.sysctl."vm.swappiness" = 100;
  swapDevices = [{ device = "/swap/swapfile"; size = 8192; }];
  # swapDevices = [{ device = "/swapfile"; size = 8192; }];
}
