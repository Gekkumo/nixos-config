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
    ./packages
    ./xwayland
    ./xdg-dirs
    ./xdg-mimes

    # Shell & Terminal
    ./kitty
    ./zsh
    ./starship
    ./tmux
    ./zoxide
    ./restic
    ./direnv
    ./fzf

    # CLI & TUI
    ./fastfetch
    ./btop
    ./yazi
    ./neovim

    # Devices
    ./ios

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
    ./kid3
    ./imv
    ./foliate

    # Windows
    ./wine

    # Documents
    ./zathura
    ./libreoffice
    ./calculator

    # Browsers & Communication
    ./firefox
    ./obsidian
    ./webcord
    ./telegram

    # Gaming & Torrents
    ./qbittorrent
    ./mangohud
    ./mesa

    # Secrets
    # ./sops
  ];
}
