{ pkgsUnstable, ... }:
{
  programs.obs-studio = {
    enable = true;
    package = pkgsUnstable.obs-studio;
    plugins = with pkgsUnstable.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-vaapi
      obs-vkcapture
      wlrobs
      obs-wayland-hotkeys
    ];
  };
}
