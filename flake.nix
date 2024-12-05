{
  description = "A simple speed dialing system for websites";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = inputs: let
    eachSystem = f: inputs.nixpkgs.lib.mapAttrs f inputs.nixpkgs.legacyPackages;
  in {
    packages = eachSystem (system: pkgs: {
      webspeeddial = pkgs.callPackage ./package.nix {
        inherit (pkgs) python3;
        inherit (pkgs.python3Packages) buildPythonApplication;
      };
      default = inputs.self.packages.${system}.webspeeddial;
    });

    devShells = eachSystem (system: pkgs: {
      default = pkgs.callPackage ./shell.nix {
        inherit (inputs.self.packages.${system}) webspeeddial;
      };
    });
  };
}
