{ stdenv, cups }:

stdenv.mkDerivation {

  name = "cups-hprtpos";
  version = "1.0";

  src = ./hprt_pos_printer_linux_driver_v1.2.8;

  buildInputs = [ cups ];

  installPhase = ''
    install -D -m 644 ppd/*.ppd $out/share/cups/model/hprtpos/
    install -D -m 755 filter/x64/raster-esc $out/lib/cups/filter/raster-esc
  '';
  
}
