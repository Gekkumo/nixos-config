{ ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    defaultCommand = "fd --type f --hidden --exclude .git";
    fileWidgetCommand = "fd --type f --hidden --exclude .git";

    defaultOptions = [
      "--height=60%"
      "--layout=reverse"
      "--border=rounded"
    ];
  };

  stylix.targets.fzf.enable = true;
}
