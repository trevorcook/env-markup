let
  envth-src = builtins.fetchGit {
      url = https://github.com/trevorcook/envth.git ;
      rev = "5e2a79a874f1dd9f35e833c593febb11704d5562"; };
  envth-overlay = self: super: { envth = import envth-src self super; };
  nixpkgs = import <nixpkgs> { overlays = [ envth-overlay ]; };
# Call Directly
#in {definition ? ./markup.nix}: nixpkgs.callPackage definition {}
# Another environment that imports the markup env
in {definition ? ./imports-markup.nix}: nixpkgs.callPackage definition {}
