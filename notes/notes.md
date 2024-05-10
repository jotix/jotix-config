# virtiofs

Error starting domain: operation failed: Unable to find a satisfying virtiofsd

add virtiofsd into your systemPackages and add following into virt-manager filesystem xml:


  <binary path="/run/current-system/sw/bin/virtiofsd"/>

# Plasma packages

paquetes que recopile tratando de hacer funcionar
las cuentas online (google drive)
pero nada funciona hasta ahora


    [
      libsForQt5.plasma-browser-integration
      libsForQt5.kaccounts-integration
      libsForQt5.kaccounts-providers
      libsForQt5.kio-gdrive
      libsForQt5.signond
      libsForQt5.qoauth
      libsForQt5.accounts-qt
      libsForQt5.mauikit-accounts
    ] ++ (with lib; filter isDerivation (attrValues pkgs.plasma5Packages.kdeGear)); ## for install all kde apps

# impresora Brother HL-1212W en Arch

## in KDE edit the connection in the setting panel
ipp://192.168.0.7/ipp/port1

## manual config
For network printers, use ipp://printer_ip/ipp/port1 as printer address.
cambiar la direccion de la impresora en el gui del DE por la indicada arriba usando la IP de la impresora, (192.168.0.7)

You can edit /etc/cups/printers.conf

In a terminal:

    sudo systemctl stop cups
    sudo vi /etc/cups/printers.conf - (or the text editor of your choice, I chose vi.)

locate the printer's URI (in bold below), it will be among all of your printers' profiles, they are arranged within tags like:

    <Printer My Poop Laser Printer>
    PrinterId 1
    UUID urn:uuid:c41ca0c7-52f3-3448-5dfe-11281fc3ac2e
    AuthInfoRequired none
    Info
    Location
    MakeModel Generic IPP Everywhere Printer
    DeviceURI ipp://192.168.200.2/printers/laser
    State Idle
    .
    .
    </Printer>

You can edit the IP there, save it.
And then restart cups...

sudo systemctl restart cups

# creating 7z encypted file

    7z a \
      -t7z -m0=lzma2 -mx=9 -mfb=64 \
      -md=32m -ms=on -mhe=on -p'eat_my_shorts' \
      archive.7z dir1

# repare windows EFI boot

asign a letter to windows and EFI partitions with diskpart
in this example the drivers c: and f:

    $ bcdboot c:\Windows /s f: /f all
