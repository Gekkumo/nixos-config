{ inputs }:
final: prev: {
  unstable = import inputs.nixpkgs-unstable {
    system = final.stdenv.hostPlatform.system;
    config = final.config;
  };
}
