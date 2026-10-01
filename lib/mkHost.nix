{ inputs }:
hostName:
inputs.nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = {
    inherit inputs;
    username = "gekkumo";
  };
  modules = [
    inputs.disko.nixosModules.disko
    inputs.home-manager.nixosModules.home-manager
    ../modules/nixos
    ../hosts/${hostName}/default.nix
  ];
}