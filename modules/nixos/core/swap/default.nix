{ ... }:
{
  boot.zswap = {
    enable = true;
    compressor = "zstd";
    maxPoolPercent = 25;
    shrinkerEnabled = true;
  };

  boot.kernel.sysctl."vm.swappiness" = 100;
}
