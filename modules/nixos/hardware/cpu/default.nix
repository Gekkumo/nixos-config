{ pkgs, ... }:
{
  hardware.cpu.intel.updateMicrocode = true;

  services.udev.extraRules = ''
    SUBSYSTEM=="powercap", ACTION=="add|change", KERNEL=="intel-rapl:*", RUN+="${pkgs.coreutils}/bin/chgrp wheel /sys/%p/energy_uj", RUN+="${pkgs.coreutils}/bin/chmod g+r /sys/%p/energy_uj"
  '';
}
