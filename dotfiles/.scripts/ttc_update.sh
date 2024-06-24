#!/usr/bin/env bash

curl -o ~/Downloads/PriceTable.zip 'https://us.tamrieltradecentre.com/download/PriceTable'
unzip -o ~/Downloads/PriceTable.zip -d ~/Downloads/PriceTable
cd ~/Downloads/PriceTable
rsync -auvzhPX --progress ~/Downloads/PriceTable/. "/home/jotix/Elder Scrolls Online/live/AddOns/TamrielTradeCentre"
