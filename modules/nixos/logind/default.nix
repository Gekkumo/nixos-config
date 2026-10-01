{ lib, config, ... }:
with lib;
let 
  cfg = config.my.system.logind;
in 
{
  options.my.system.logind.enable = mkEnableOption "logind power management";

  config = mkIf cfg.enable {
    services.logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchDocked = "suspend";
      HandleLidSwitchExternalPower = "suspend";
      HandlePowerKey = "ignore";
      HandlePowerKeyLongPress = "poweroff";
      HandleSuspendKey = "suspend";
      HandleHibernateKey = "hibernate";
    };
  };
}