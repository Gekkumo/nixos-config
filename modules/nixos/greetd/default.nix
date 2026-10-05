{ config, lib, pkgs, username, ... }:
with lib;
let
  cfg = config.my.greetd;

  modeString =
    if cfg.refreshRate == null
    then cfg.resolution
    else "${cfg.resolution}@${cfg.refreshRate}Hz";
in
{
  options.my.greetd = {
    monitor = mkOption {
      type = types.str;
      description = "Monitor output name for greeter";
    };

    resolution = mkOption {
      type = types.str;
      description = "Resolution for greeter monitor";
    };

    refreshRate = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = ''
        Refresh rate in Hz for the greeter monitor.
        If null, wlr-randr picks the default mode for the resolution.
      '';
    };

    cageOrder = mkOption {
      type = types.enum [ "first" "last" ];
      default = "last";
      description = "Which monitor Cage should use";
    };
  };

  config = {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.cage}/bin/cage -s -m ${cfg.cageOrder} -- ${pkgs.writeShellScript "regreet-wrapper" ''
            ${pkgs.wlr-randr}/bin/wlr-randr --output ${cfg.monitor} --mode ${modeString}
            exec ${pkgs.greetd.regreet}/bin/regreet
          ''}";
          user = "greeter";
        };
        initial_session = {
          command = "${config.programs.niri.package}/bin/niri-session";
          user = username;
        };
      };
    };

    programs.regreet.enable = true;
    systemd.user.services.niri.enableDefaultPath = false;
  };
}
