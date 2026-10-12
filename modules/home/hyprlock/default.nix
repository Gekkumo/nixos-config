{ config, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;
  wallpaper = ./assets/wallpaper.png;
  avatar = ./assets/avatar.png;
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        grace = 0;
      };

      background = [
        {
          monitor = "";
          path = "${wallpaper}";
          blur_passes = 1;
          blur_size = 1;
          contrast = 0.8916;
          brightness = 0.95;
          vibrancy = 0.1696;
        }
      ];

      image = [
        {
          monitor = "";
          path = "${avatar}";
          size = 170;
          rounding = -1;
          border_size = 2;
          border_color = "${colors.base03}";
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          size = "250, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "${colors.base05}";
          inner_color = "${colors.base01}";
          outer_color = "${colors.base03}";
          check_color = "${colors.base03}";
          fail_color = "${colors.base03}";
          outline_thickness = 2;
          placeholder_text = "Enter password...";
          shadow_passes = 2;
        }
      ];
    };
  };

  stylix.targets.hyprlock.enable = false;
}
