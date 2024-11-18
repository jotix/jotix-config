{ stdenv, cups, lib, glibc, gcc-unwrapped, autoPatchelfHook }:

stdenv.mkDerivation {

  name = "cups-hprtpos";
  version = "1.0";
  system = "x86_64-linux";

  src = ./hprt_pos_printer_linux_driver_v1.2.8;

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [ 
    cups 
    glibc
    gcc-unwrapped
  ];

  installPhase = ''
    install -d -m 777 $out/share/cups/model/hprtpos/
    install -m 644 ppd/*.ppd $out/share/cups/model/hprtpos/
    install -m 755 -D filter/x64/raster-esc $out/lib/cups/filter/raster-esc
  '';

  meta = with lib; {
    description = "CUPS filter for HPRT POS thermal printers";
    homepage = "https://github.com/jotix";
    platforms = platforms.linux;
    maintainers = with maintainers; [ jotix ];
    license = licenses.bsd2;
  };
  
}
