{ stdenv, cups }:

stdenv.mkDerivation rec {

  name = "hprt-tp806l-${version}";
  version = "1.0";

  src = ./.;

  buildInputs = [ cups ];

  installPhase = ''
    mkdir -p $out/share/cups/model/
    cp tp806l.ppd $out/share/cups/model/
    mkdir -p $out/lib/cups/filter/
    cp raster-esc $out/lib/cups/filter/
    chmod +x $out/lib/cups/filter/raster-esc
  '';
    
#    # If you need to patch the path to files outside the nix store, you can do it this way
#    # (if the ppd also comes with executables you may need to also patch the executables)
#    substituteInPlace $out/share/cups/model/tp806l.ppd  --replace raster-esc $out/bin/raster-esc
#  '';
  
}
