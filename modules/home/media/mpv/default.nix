{ ... }:
{
  programs.mpv = {
    enable = true;

    config = {
      hwdec = "vaapi";
      vo = "gpu";
      gpu-context = "waylandvk";
      gpu-api = "vulkan";
      loop-file = "inf";
      profile = "high-quality";
      save-position-on-quit = true;
      keep-open = true;
      force-window = true;
    };
  };
}
