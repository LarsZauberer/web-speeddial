{
  mkShellNoCC,
  webspeeddial,
}:
mkShellNoCC {
  name = "devshell";
  inputsFrom = webspeeddial.nativeBuildInputs;
}
