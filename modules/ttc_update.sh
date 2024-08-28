#!/usr/bin/env bash

TTC_JTX_PATH="/mnt/jtx-ssd/SteamLibrary/steamapps/compatdata/306130/pfx/drive_c/users/steamuser/Documents/Elder Scrolls Online/live/AddOns/TamrielTradeCentre"

TTC_FFM_PATH="/home/jotix/.local/share/Steam/steamapps/compatdata/306130/pfx/drive_c/users/steamuser/My Documents/Elder Scrolls Online/live/AddOns/TamrielTradeCentre"

if [$HOSTNAME -eq "jtx-nixos"]; then
    TTC_PATH=$TTC_JTX_PATH
else
    TTC_PATH=$TTC_FFM_PATH
fi

curl -o ~/Downloads/PriceTable.zip 'https://us.tamrieltradecentre.com/download/PriceTable'
unzip -o ~/Downloads/PriceTable.zip -d ~/Downloads/PriceTable
cd ~/Downloads/PriceTable

rsync -auvzhPX --progress ~/Downloads/PriceTable/. $TTC_PATH
