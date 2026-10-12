{ pkgs, lib, ... }:
{
  xdg.configFile."waybar/scripts/toggle-audio.sh" = {
    source = ./scripts/toggle-audio.sh;
    executable = true;
  };
  xdg.configFile."waybar/scripts/pomodoro-status.sh" = {
    source = ./scripts/pomodoro-status.sh;
    executable = true;
  };
  xdg.configFile."waybar/scripts/pomodoro-cancel.sh" = {
    source = ./scripts/pomodoro-cancel.sh;
    executable = true;
  };
  xdg.configFile."waybar/scripts/pomodoro-toggle.sh" = {
    source = ./scripts/pomodoro-toggle.sh;
    executable = true;
  };
  xdg.configFile."waybar/scripts/notification.wav" = {
    source = ./scripts/notification.wav;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 5;

        modules-left = [ "custom/power" "niri/workspaces" ];
        modules-center = [ "clock" "custom/pomodoro" ];
        modules-right = [ "tray" "temperature#gpu" "temperature#cpu" "niri/language" "wireplumber#source" "wireplumber#sink" ];

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
          format = "{volume}% {icon}";
          "format-muted" = " {volume}%";
          "format-icons" = ["" "" ""];
          "on-click" = "~/.config/waybar/scripts/toggle-audio.sh";
          "on-scroll-up" = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2%+";
          "on-scroll-down" = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2%-";
          "scroll-step" = 2.0;
        };

        "wireplumber#source" = {
          "node-type" = "Audio/Source";
          format = "{volume}% {icon}";
          "format-muted" = " {volume}%";
          "format-icons" = ["" ""];
          "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          "on-scroll-up" = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 2%+";
          "on-scroll-down" = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 2%-";
          "scroll-step" = 2.0;
        };

        "tray" = { "icon-size" = 14; spacing = 10; cursor = true; };

        "custom/power" = {
          format = "";
          tooltip = false;
          "on-click" = "wlogout";
        };

        "clock" = {
          format = "{:%a %d.%m.%Y ~ %H:%M}";
          tooltip = false;
        };

        "custom/pomodoro" = {
          exec = "~/.config/waybar/scripts/pomodoro-status.sh";
          interval = "once";
          signal = 8;
          on-click = "~/.config/waybar/scripts/pomodoro-toggle.sh";
          on-click-right = "~/.config/waybar/scripts/pomodoro-cancel.sh";
        };
      };
    };

    style = lib.mkAfter ''
      * {
        font-family: "FiraCode Nerd Font", "Symbols Nerd Font", "Fira Sans";
        font-size: 13px;
        font-weight: bold;
        min-height: 0;
      }

      #custom-power, #clock, #wireplumber { padding: 0 1px; }
      #wireplumber { margin-left: 3px; margin-right: 6px; }
      #clock { margin-right: 5px; }
      #custom-pomodoro { padding: 0 8px; margin-left: 4px; }
      #custom-power { padding: 0px 0px 0px 10px; }
      #tray { padding-right: 1px; }

      #custom-power {
        padding: 0px 0px 0px 10px;
        margin-right: 12px;
        font-size: 16px;
      }

      #temperature {
        padding: 0 10px;
        margin-left: 4px;
      }
    '';
  };

  stylix.targets.waybar.enable = true;
}
