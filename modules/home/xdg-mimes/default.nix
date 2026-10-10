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
      "image/jpg" = [ "imv.desktop" ];
      "image/gif" = [ "imv.desktop" ];
      "image/webp" = [ "imv.desktop" ];
      "image/svg+xml" = [ "imv.desktop" ];
      "image/tiff" = [ "imv.desktop" ];
      "image/bmp" = [ "imv.desktop" ];

      # Video
      "video/mp4" = [ "mpv.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
      "video/webm" = [ "mpv.desktop" ];
      "audio/mp4" = [ "mpv.desktop" ];
      "audio/x-m4a" = [ "mpv.desktop" ];
      "audio/aac" = [ "mpv.desktop" ];
      "audio/opus" = [ "mpv.desktop" ];
      "video/x-msvideo" = [ "mpv.desktop" ];
      "video/quicktime" = [ "mpv.desktop" ];
      "video/x-flv" = [ "mpv.desktop" ];

      # Audio
      "audio/mpeg" = [ "mpv.desktop" ];
      "audio/flac" = [ "mpv.desktop" ];
      "audio/ogg" = [ "mpv.desktop" ];
      "audio/wav" = [ "mpv.desktop" ];

      # PDF
      "application/pdf" = [ "miro.desktop" ];

      # Directory
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
      "application/zip" = [ "org.gnome.FileRoller.desktop" ];
      "application/x-tar" = [ "org.gnome.FileRoller.desktop" ];
      "application/x-7z-compressed" = [ "org.gnome.FileRoller.desktop" ];
      "application/x-rar" = [ "org.gnome.FileRoller.desktop" ];

      # Windows executables
      "application/x-ms-dos-executable" = [ "wine.desktop" ];
      "application/x-msdownload" = [ "wine.desktop" ];
      "application/x-msi" = [ "wine.desktop" ];

      # Neovim
      "text/plain" = [ "nvim.desktop" ];
      "text/markdown" = [ "nvim.desktop" ];
      "text/csv" = [ "nvim.desktop" ];
      "text/x-shellscript" = [ "nvim.desktop" ];
      "text/x-python" = [ "nvim.desktop" ];
      "text/x-go" = [ "nvim.desktop" ];
      "text/css" = [ "nvim.desktop" ];
      "text/javascript" = [ "nvim.desktop" ];
      "text/x-c" = [ "nvim.desktop" ];
      "text/x-c++" = [ "nvim.desktop" ];
      "text/x-java" = [ "nvim.desktop" ];
      "text/x-rust" = [ "nvim.desktop" ];
      "text/x-php" = [ "nvim.desktop" ];
      "text/x-yaml" = [ "nvim.desktop" ];
      "text/x-toml" = [ "nvim.desktop" ];
      "text/x-xml" = [ "nvim.desktop" ];
      "application/json" = [ "nvim.desktop" ];
      "text/x-dockerfile" = [ "nvim.desktop" ];
      "text/x-nix" = [ "nvim.desktop" ];
      "text/x-terraform" = [ "nvim.desktop" ];
    };
  };

  home.sessionVariables = {
    BROWSER = "firefox.desktop";
  };
}
