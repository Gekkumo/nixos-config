{ ... }:
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    documents = "$HOME/Documents";
    download = "$HOME/Downloads";
    music = "$HOME/Music";
    pictures = "$HOME/Pictures";
    videos = "$HOME/Videos";

    desktop = null;
    publicShare = null;
    templates = null;
  };
}