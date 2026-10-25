{ lib, config, ... }:
{
  xdg.configFile."waybar/scripts/toggle-audio.sh" = {
    source = ./scripts/toggle-audio.sh;
    executable = true;
  };

  xdg.configFile."waybar/scripts/toggle-inhibit.sh" = {
    source = ./scripts/toggle-inhibit.sh;
    executable = true;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        output = "HDMI-A-1";
        layer = "top";
        position = "top";
        height = 35;
        spacing = 2;

        modules-left = [
          "custom/power"
          "niri/workspaces"
          "mpris"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "custom/tomat"
          "niri/language"
          "temperature#cpu"
          "temperature#gpu"
          "wireplumber#source"
          "wireplumber#sink"
          "custom/inhibit"
        ];

        "custom/power" = {
          format = "";
          tooltip = false;
          "on-click" = "wlogout";
        };

        "niri/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "●";
          format-icons = {
            active = "●";
          };
        };

        "mpris" = {
          "player-order" = [
            "mpd"
            "firefox"
            "mpv"
          ];
          "format" = "{player_icon} {dynamic}";
          "format-paused" = "{status_icon} {dynamic}";
          "player-icons" = {
            "default" = "󰀘";
            "mpd" = "";
            "firefox" = "󰈹";
            "mpv" = "";
          };
          "status-icons" = {
            "paused" = "";
          };
          "dynamic-order" = [
            "artist"
            "title"
          ];
          "dynamic-separator" = " - ";
          "on-click" = "playerctl play-pause";
          "on-click-right" = "playerctl next";
          "on-scroll-up" = "playerctl -a pause; playerctl -p mpd play";
          "on-scroll-down" = "playerctl -a pause; playerctl -p firefox play";
          "artist-len" = 40;
          "title-len" = 50;
          "dynamic-len" = 90;
        };

        "clock" = {
          format = "{:%a %d.%m.%Y ~ %H:%M}";
          tooltip = false;
        };

        "tray" = {
          "icon-size" = 14;
          spacing = 8;
          cursor = true;
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

        "niri/language" = {
          format = "{}";
          format-en = "🇺🇸";
          format-ru = "🇷🇺";
          tooltip = false;
        };

        "temperature#cpu" = {
          "hwmon-path" = "/sys/devices/platform/coretemp.0/hwmon/hwmon3/temp1_input";
          "format" = "{temperatureC}°C";
          "interval" = 2;
          "on-click" = "kitty -e btop";
        };

        "temperature#gpu" = {
          "hwmon-path" =
            "/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.0/hwmon/hwmon2/temp1_input";
          "format" = "{temperatureC}°C";
          "interval" = 2;
          "on-click" = "lact";
        };

        "wireplumber#source" = {
          "node-type" = "Audio/Source";
          format = "{volume}%";
          "format-muted" = " {volume}%";
          "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          "on-click-middle" = "kitty -e wiremix";
          "on-scroll-up" = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 2%+";
          "on-scroll-down" = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 2%-";
          "scroll-step" = 2.0;
        };

        "wireplumber#sink" = {
          format = "{volume}%";
          "format-muted" = "xx%";
          "on-click" = "${config.home.homeDirectory}/.config/waybar/scripts/toggle-audio.sh";
          "on-click-middle" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "on-scroll-up" = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2%+";
          "on-scroll-down" = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2%-";
          "scroll-step" = 2.0;
        };

        "custom/inhibit" = {
          exec = "${config.home.homeDirectory}/.config/waybar/scripts/toggle-inhibit.sh --status";
          signal = 8;
          format = "{}";
          on-click = "${config.home.homeDirectory}/.config/waybar/scripts/toggle-inhibit.sh";
          return-type = "json";
          tooltip-format = "Idle Inhibitor";
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

      #custom-power {
        margin-left: 6px;
        margin-right: 5px;
        font-size: 25px;
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

      #workspaces button.active {
        color: @base05;
      }

      #workspaces button:hover {
        color: @base0D;
      }

      #mpris {
        margin-left: 2px;
      }

      #tray {
        margin-right: 5px;
      }

      #temperature.cpu,
      #temperature#cpu {
        color: #8ba3c9;
      }

      #temperature.gpu,
      #temperature#gpu {
        color: #c98b8b;
      }

      #custom-inhibit {
        margin-right: 5px;
      }
    '';
  };
}
