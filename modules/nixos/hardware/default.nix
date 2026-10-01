{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;
  hardware.amdgpu.overdrive.enable = true;

  environment.systemPackages = with pkgs; [
    lact
  ];

  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];

  services.udev.extraRules = ''
    # Даём группе wheel доступ к чтению RAPL energy_uj
    SUBSYSTEM=="powercap", ACTION=="add|change", KERNEL=="intel-rapl:*", \
      RUN+="${pkgs.coreutils}/bin/chmod", "g+r", "/sys/class/powercap/intel-rapl:0/energy_uj"
  '';
}