{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mangohud
  ];

  programs.mangohud = {
    enable = true;
    settings = {
      fps_limit = "60,120,144,200,0";
      fps_limit_method = "late";
      
      arch = true;
      cpu_mhz = true;
      cpu_power = true;
      cpu_temp = true;
      display_server = true;
      engine_version = true;
      fps_metrics = true;
      gamemode = true;
      gpu_core_clock = true;
      gpu_fan = true;
      gpu_junction_temp = true;
      gpu_mem_clock = true;
      gpu_mem_temp = true;
      gpu_power = true;
      gpu_temp = true;
      gpu_voltage = true;
      ram = true;
      resolution = true;
      show_fps_limit = true;
      vram = true;
      vulkan_driver = true;
      wine = true;
      winesync = true;
    };
  };

  stylix.targets.mangohud.enable = true;
}