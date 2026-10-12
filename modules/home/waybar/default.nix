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
        spacing = 4;

        modules-left = [ "custom/power" "niri/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "custom/tomat" "niri/language" "temperature#gpu" "temperature#cpu" "wireplumber#source" "wireplumber#sink" ];

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
          "format-muted" = "%";
          "on-click" = "~/.config/waybar/scripts/toggle-audio.sh";
          "on-click-middle" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "on-scroll-up" = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2%+";
          "on-scroll-down" = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2%-";
          "scroll-step" = 2.0;
        };

        "wireplumber#source" = {
          "node-type" = "Audio/Source";
          format = "{volume}%";
          "format-muted" = "{volume}% ";
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

      #waybar {
        padding: 0 2px;
      }

      #custom-power, #clock, #wireplumber, #temperature, #custom-tomat, #tray, #niri-language {
        padding: 0 1px;
      }

      #workspaces button {
        padding: 0 2px;
        color: @base03;
        border: none;
        border-radius: 0;
        background: transparent;
      }

      #workspaces button.active {
        color: @base05;
      }

      #workspaces button:hover {
        color: @base0D;
      }

      #custom-power {
        font-size: 25px;
      }
    '';
  };

  stylix.targets.waybar.enable = true;
}
