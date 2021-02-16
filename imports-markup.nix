{ envth, callPackage } : with envth;
mkEnvironment rec {
  name = "imports-markup";
  definition = ./imports-markup.nix;
  imports = [
    (callPackage ./markup.nix { markupdir = ./docs; }) # pass docdir
    # ./markup.nix #uses defaults
    ];

}
