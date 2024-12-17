{
  python3,
  buildPythonApplication,
}: let
  pname = "webspeeddial";
  version = "1.0";
in
  buildPythonApplication {
    inherit pname version;

    nativeBuildInputs = [python3];

    src = ./.;

    installPhase = ''
      mkdir -p $out/bin
      cp ${./main.py} $out/bin/webspeeddial
      chmod +x $out/bin/webspeeddial
    '';
  }
