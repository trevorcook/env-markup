{ envth,pandoc, inkscape, markupdir ? ./docs } : with envth; with builtins;
let markupdirIn = markupdir;
    inDir = dir: cmds: ''
    ( cd ${dir}
    ${cmds}
    )
    '';
in mkEnvironment rec {
  name = "markup";
  definition = ./markup.nix;
  # The list of software and libraries added to the path.
  paths = [ pandoc inkscape] ;
  markupdir = mkSrc markupdirIn;
  passthru = {inherit envth; };
  envlib = {
    markup-convert-svg-to-pdf = ''
      local j
      local svgs=$(ls *.svg)
      for i in $svgs ; do
        j="''${i%.*}.pdf"
        if [[ ! -f $j ]] || [[ $i -nt $j ]] ; then
          echo inkscape --export-filename=''${i%.*}.pdf $i
          inkscape --export-pdf=''${i%.*}.pdf $i 2>inkscape.log
        fi
      done
      '';
    markup-doc = inDir markupdir.local ''
       # input basename of document (no .md extension) in `markupdir`
       ( cd img ; markup-convert-svg-to-pdf; )
       pandoc --variable urlcolor=cyan -t beamer -H slide.sty -o "$1.pdf" "$1.md"
      '';
    stylus-builtin = ''xsetwacom -v set 12 MapToOutput eDP-1'';
    stylus-extended = ''xsetwacom -v set 12 MapToOutput HDMI-1'';
    };
}
