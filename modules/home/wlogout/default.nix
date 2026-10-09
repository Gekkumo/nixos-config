{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ wlogout ];

  xdg.configFile."wlogout/layout".source = ./configs/layout;
  xdg.configFile."wlogout/style.css".text = with config.lib.stylix.colors.withHashtag; ''
    * {
      font-family: "FiraCode Nerd Font";
      font-size: 60px;
      background-image: none;
      box-shadow: none;
    }

    window {
      background: alpha(@base00, 0.85);
    }

    button {
      color: @base05;
      background-color: alpha(@base02, 0.6);
      border-radius: 2px;
      margin: 10px;
      padding: 20px;
      transition: all 0.2s ease-in-out;
    }

    button:hover {
      background-color: alpha(@base03, 0.9);
      color: @base07;
    }

    button:focus {
      outline: none;
    }

    #decor1 {
      background-image: url("assets/image1.png");
      background-size: contain;
      background-repeat: no-repeat;
      background-position: center;
      color: transparent;
    }

    #decor2 {
      background-image: url("assets/image2.png");
      background-size: contain;
      background-repeat: no-repeat;
      background-position: center;
      color: transparent;
    }
  '';

  xdg.configFile."wlogout/assets/image1.png".source = ./configs/assets/image1.png;
  xdg.configFile."wlogout/assets/image2.png".source = ./configs/assets/image2.png;
}
