{ pkgs, lib, ... }:
let
  toggleAudioScript = pkgs.writeShellScript "toggle-audio" ''
    WPCTL="${pkgs.wireplumber}/bin/wpctl"

    SINKS=($($WPCTL status | sed -n '/Sinks:/,/Sources:/p' | grep -oP '^\s*│\s+\d+' | grep -oP '\d+' | while read id; do
        name=$($WPCTL inspect "$id" 2>/dev/null | grep 'node.name' | head -1)
        if [[ "$name" != *".monitor"* ]]; then
            echo "$id"
        fi
    done))

    [ ''${#SINKS[@]} -le 1 ] && exit 0

    CURRENT=$($WPCTL status | grep '\*' | grep -oP '^\s*│\s+\K\d+')

    NEXT=""
    for i in "''${!SINKS[@]}"; do
        if [ "''${SINKS[$i]}" = "$CURRENT" ]; then
            NEXT=''${SINKS[$(((i + 1) % ''${#SINKS[@]}))]}
            break
        fi
    done

    [ -n "$NEXT" ] && $WPCTL set-default "$NEXT"
  '';
in
{
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
        modules-center = [ "clock" ];
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
          "on-click" = "${toggleAudioScript}";
          "on-scroll-up" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+";
          "on-scroll-down" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-";
          "scroll-step" = 2.0;
        };

        "wireplumber#source" = {
          "node-type" = "Audio/Source";
          format = "{volume}% {icon}";
          "format-muted" = " {volume}%";
          "format-icons" = ["" ""];
          "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          "on-scroll-up" = "wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%+";
          "on-scroll-down" = "wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%-";
          "scroll-step" = 2.0;
        };

        "tray" = { "icon-size" = 14; spacing = 10; cursor = true; };

        "custom/power" = {
          format = " ";
          tooltip = false;
          "on-click" = "wlogout";
        };

        "clock" = {
          format = "{:%a %d/%m/%Y ~ %H:%M}";
          tooltip = false;
        };
      };
    };

    style = lib.mkAfter ''
      * {
        font-family: "Fira Sans", "FiraCode Nerd Font";
        font-size: 13px;
        font-weight: bold;
        min-height: 0;
      }

      #custom-power, #clock, #wireplumber { padding: 0 1px; }
      #wireplumber { margin-left: 3px; margin-right: 6px; }
      #clock { margin-right: 5px; }
      #custom-power { padding: 0px 0px 0px 10px; }
      #tray { padding-right: 1px; }

      #temperature {
        padding: 0 10px;
        margin-left: 4px;
      }
    '';
  };

  stylix.targets.waybar.enable = true;
}
