{ ... }:
{
  imports = [
    # System & Core
    ./xwayland
    ./xdg-dirs
    ./xdg-mimes

    # WM & Desktop
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
    ./keepassxc
    ./gnupg

    # Media
    ./foliate
    ./mpv
    ./mpd
    ./rmpc
    ./kid3
    ./imv

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

    # Backup
    ./restic

    # Devices
    ./ios

    # Windows Compatibility
    ./wine
  ];
}
