#!/usr/bin/env bash

curl -o ~/Downloads/PriceTable.zip 'https://us.tamrieltradecentre.com/download/PriceTable'
unzip -o ~/Downloads/PriceTable.zip -d ~/Downloads/PriceTable
cd ~/Downloads/PriceTable
rsync -auvzhPX --progress ~/Downloads/PriceTable/. "/mnt/jtx-nvme/SteamLibrary/steamapps/compatdata/306130/pfx/drive_c/users/steamuser/Documents/Elder Scrolls Online/live/AddOns/TamrielTradeCentre"
