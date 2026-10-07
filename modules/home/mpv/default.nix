{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      hwdec = "vaapi";
      vo = "gpu";
      gpu-context = "wayland";
      loop-file = "inf";
      gpu-api = "vulkan";
      profile = "high-quality";
      save-position-on-quit = true;
      keep-open = true;
      force-window = true;
    };
  };
}
