{ ... }:
{
  services.tomat = {
    enable = true;
    settings = {
      timer = {
        work = 25;
        break = 5;
        long_break = 15;
        sessions = 4;
        auto_advance = "none";
      };
      notification.enabled = true;
      sound.enabled = true;
      display = {
        text_format = "{time} {state}";
        text_format_idle = "{icon}";
      };
    };
  };
}
