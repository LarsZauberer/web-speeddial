{
  description = "A simple speed dialing system for websites";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    forAllSystems = function:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
      ] (system: function nixpkgs.legacyPackages.${system});
  in {
    packages = forAllSystems (
      pkgs: let
        package = pkgs.callPackage ./package.nix {};
      in {
        default = package.defaultPackage;
        devShell = package.defaultPackage;
      }
    );
  };
}
