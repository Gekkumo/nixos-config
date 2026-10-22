{ pkgs, ... }:
{
  home.packages = with pkgs; [
    yamllint
    shellcheck
    shfmt
    hadolint
    actionlint
    nix-output-monitor
    nixfmt
    nixd
    statix
    deadnix
  ];
}
