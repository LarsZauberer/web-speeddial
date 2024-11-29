{pkgs}: let
  bi = with pkgs; [
  ];

  nbi = with pkgs; [
    python3
  ];
in {
  defaultPackage = pkgs.python3Packages.buildPythonApplication {
    pname = "webspeeddial";
    version = "1.0";

    nativeBuildInputs = nbi;

    src = ./.;

    installPhase = ''
      mkdir -p $out/bin
      cp ${./main.py} $out/bin/webspeeddial
      chmod +x $out/bin/webspeeddial
    '';
  };

  devShell = pkgs.mkShell {
    buildInputs = bi;
    nativeBuildInputs = nbi;
  };
}
