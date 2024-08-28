{ pkgs, ... }:

let
  tcc-price-update = pkgs.writeShellApplication {
    name = "tcc-price-update";

    runtimeInputs = [ pkgs.curl pkgs.unzip pkgs.rsync ];

    text = ''
      curl -o ~/Downloads/PriceTable.zip 'https://us.tamrieltradecentre.com/download/PriceTable'
      unzip -o ~/Downloads/PriceTable.zip -d ~/Downloads/PriceTable
      cd ~/Downloads/PriceTable
      rsync -auvzhPX --progress ~/Downloads/PriceTable/. "/home/jotix/Elder Scrolls Online/live/AddOns/TamrielTradeCentre"
    '';
  };
in
{
  environment.systemPackages = [ tcc-price-update ];
}
