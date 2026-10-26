{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    unstable.spectral-mic
  ];
}
