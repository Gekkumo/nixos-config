{ ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Browser
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];

      # Images
      "image/png" = [ "imv.desktop" ];
      "image/jpeg" = [ "imv.desktop" ];
      "image/gif" = [ "imv.desktop" ];
      "image/webp" = [ "imv.desktop" ];

      # Video
      "video/mp4" = [ "mpv.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
      "video/webm" = [ "mpv.desktop" ];

      # PDF
      "application/pdf" = [ "miro.desktop" ];

      # Directory
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
    };
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
    BROWSER = "firefox.desktop";
  };
}
