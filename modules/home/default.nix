{ ... }:
{
  imports = [
    # WM
    ./niri
    ./wlogout
    ./waybar
    ./fuzzel
    ./mako
    ./hyprlock
    ./hypridle
    ./swaybg
    ./tomat
    ./gtk
    ./qt
    ./xwayland
    ./xdg-dirs
    ./xdg-mimes

    # Shell & Terminal
    ./kitty
    ./zsh
    ./starship
    ./tmux
    ./zoxide
    ./direnv
    ./fzf

    # CLI & TUI
    ./fastfetch
    ./btop
    ./yazi
    ./neovim

    # DevOps
    ./git
    ./lazygit
    ./ansible
    ./terraform
    ./kubernetes
    ./vscode

    # Security
    ./gnupg
    ./keepassxc

    # Media
    ./mpv
    ./mpd
    ./rmpc
    ./imv
    ./foliate

    # Windows
    ./wine

    # Documents
    ./zathura
    ./libreoffice

    # Browsers & Communication
    ./firefox
    ./obsidian
    ./webcord
    ./telegram

    # Gaming & Torrents
    ./qbittorrent
    ./mangohud

    # Secrets
    # ./sops
  ];
}
