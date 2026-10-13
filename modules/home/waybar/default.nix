{ lib, ... }:
{
  xdg.configFile."waybar/scripts/toggle-audio.sh" = {
    source = ./scripts/toggle-audio.sh;
    executable = true;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 2;

        modules-left = [ "custom/power" "niri/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "custom/tomat" "niri/language" "temperature#gpu" "temperature#cpu" "wireplumber#source" "wireplumber#sink" "idle_inhibitor" ];

        "niri/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "●";
          format-icons = { active = "●"; };
        };

        "niri/language" = {
          format = "{}";
          format-en = "🇺🇸";
          format-ru = "🇷🇺";
          tooltip = false;
        };

        "temperature#cpu" = {
          "hwmon-name" = "coretemp";
          "input-filename" = "temp1_input";
          "format" = "{temperatureC}°C ";
          "interval" = 2;
        };

        "temperature#gpu" = {
          "hwmon-name" = "amdgpu";
          "input-filename" = "temp1_input";
          "format" = "{temperatureC}°C";
          "interval" = 2;
        };

        "wireplumber#sink" = {
          format = "{volume}%";
          "format-muted" = " ";
          "on-click" = "~/.config/waybar/scripts/toggle-audio.sh";
          "on-click-middle" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "on-scroll-up" = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2%+";
          "on-scroll-down" = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2%-";
          "scroll-step" = 2.0;
        };

        "wireplumber#source" = {
          "node-type" = "Audio/Source";
          format = "{volume}%";
          "format-muted" = " {volume}%";
          "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          "on-scroll-up" = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 2%+";
          "on-scroll-down" = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 2%-";
          "scroll-step" = 2.0;
        };

        "tray" = { "icon-size" = 14; spacing = 8; cursor = true; };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "ON";
            deactivated = "OFF";
          };
          tooltip-format-activated = "Idle inhibitor: ON";
          tooltip-format-deactivated = "Idle inhibitor: OFF";
        };

        "custom/power" = {
          format = "";
          tooltip = false;
          "on-click" = "wlogout";
        };

        "custom/tomat" = {
          exec = "tomat status";
          interval = 1;
          return-type = "json";
          format = "{text}";
          tooltip = true;
          on-click = "tomat toggle";
          on-click-right = "tomat skip";
          on-click-middle = "tomat stop";
        };

        "clock" = {
          format = "{:%a %d.%m.%Y ~ %H:%M}";
          tooltip = false;
        };
      };
    };

    style = lib.mkAfter ''
      * {
        font-family: "FiraCode Nerd Font", "Symbols Nerd Font", "Fira Sans";
        font-size: 14px;
        font-weight: bold;
        min-height: 0;
      }

      .modules-left #workspaces button,
      .modules-center #workspaces button,
      .modules-right #workspaces button {
        border-bottom: none;
        padding: 0 2px;
        color: @base03;
        border: none;
        border-radius: 0;
        background: transparent;
      }

      .modules-left #workspaces button.focused,
      .modules-left #workspaces button.active,
      .modules-center #workspaces button.focused,
      .modules-center #workspaces button.active,
      .modules-right #workspaces button.focused,
      .modules-right #workspaces button.active {
        border-bottom: none;
        color: @base05;
      }

      .modules-left #workspaces button:hover,
      .modules-center #workspaces button:hover,
      .modules-right #workspaces button:hover {
        border-bottom: none;
        color: @base0D;
      }

      #tray {
        margin-right: 5px;
      }

      #workspaces button.active {
        color: @base05;
      }

      #workspaces button:hover {
        color: @base0D;
      }

      #idle_inhibitor {
        margin-right: 5px;
      }

      #custom-power {
        margin-left: 5px;
        margin-right: 5px;
        font-size: 25px;
      }
    '';
  };

  stylix.targets.waybar.enable = true;
}
