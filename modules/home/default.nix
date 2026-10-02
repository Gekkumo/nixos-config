{ ... }:
{
  imports = [
    # WM/DE
    ./niri
    ./gnome
    ./dms
    ./gtk
    ./qt
    ./xwayland
    ./nemo
    ./xdg-dirs
    ./xdg-mimes

    # Shell
    ./kitty
    ./zsh
    ./starship
    ./tmux
    ./zoxide
    ./direnv
    ./fzf

    # CLI
    ./fastfetch
    ./btop
    ./yazi
    ./fend
    ./neovim

    # Git
    ./git
    ./lazygit

    # Security
    ./gnupg
    ./keepassxc

    # Media
    ./mpv
    ./mpd
    ./rmpc
    ./imv
    ./miro

    # Browsers & Communication
    ./firefox
    ./obsidian
    ./webcord
    ./telegram

    # Gaming & Torrents
    ./qbittorrent
    ./mangohud

    # ./sops
  ];
}