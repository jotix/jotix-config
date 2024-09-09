# default configuration

{ pkgs, ... }:

{
  imports = [
    ./hardware-config.nix
    ./ttc-price-update.nix
  ];
  
  nix = {
    package = pkgs.nixFlakes; # or versioned attributes like nixVersions.nix_2_8
    extraOptions = ''experimental-features = nix-command flakes'';
  };

  nixpkgs.config.allowUnfree = true;

  #security.pam.services.swaylock = {};

  system.stateVersion = "24.05";

  home-manager.backupFileExtension = "bak";

  ### graphics drivers ########################################################
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  ### keyboard layout
  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

  ### boot #####################################################################
  boot = {
    # kernel version
    #kernelPackages = pkgs.linuxKernel.packages.linux_6_8;

    supportedFilesystems = [ "ntfs" ];
    
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
    };
  };

  ### networking ###############################################################
  networking = {
    networkmanager.enable = true;
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };

  ### environment ##############################################################
  environment = {
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake .#$HOSTNAME";
      rebuild-boot = "sudo nixos-rebuild boot --flake .#$HOSTNAME";
      cdc = "cd ~/nixos-config";
    };
  };

  ### locale #################################################################
  time.timeZone = "America/Argentina/Buenos_Aires";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "es_AR.UTF-8/UTF-8"
  ];

  i18n.extraLocaleSettings = {
    LANG     = "en_US.UTF-8";
    LANGUAGE = "en_US.UTF-8";
    LC_ALL   = "es_AR.UTF-8";
  };

  ### users ####################################################################
  users = {
    users.jotix = {
      isNormalUser = true;
      description = "jotix";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    };
    defaultUserShell = pkgs.bash;
  };
  
  ### servicess ################################################################

  ### pipewire
  #sound.enable = true;
  #hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  ### syncthing
  services.syncthing = {
    enable = true;
    user = "jotix";
    dataDir = "/home/jotix";
    configDir = "/home/jotix/.config/syncthing";
    overrideFolders = false;
    overrideDevices = false;
  };

  services = {
    printing = {
      enable = true;
      drivers = [ pkgs.brlaser pkgs.cups-zj-58 ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

  services.flatpak.enable = true;

  ### Desktop
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoNumlock = true;
  };

  services.desktopManager.plasma6.enable = true;

  ### packages #################################################################
  environment.systemPackages = with pkgs; [
    exfat
    exfatprogs
    ntfs3g
    usbutils
    pciutils
    gnumake
    cmake
    gcc
    nixd
    zip
    unzip
    p7zip
    killall
    wget
    fastfetch
    wlr-randr
    mpv
    htop
    fuse
    wl-clipboard
    xclip
    virtiofsd
    gparted
    qmk
    qmk-udev-rules
    vial
    spotify
    gimp
    firefox
    libreoffice
    inkscape
    python3
    kdePackages.kate
    kdePackages.kcalc
    digikam
    ventoy-full
    transmission_3
    transmission_3-qt
    ghostscript
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    fira-code
    fira-code-nerdfont
    ubuntu_font_family
  ];

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      #pinentryPackage = pkgs.pinentry-curses;
    };
    fuse.userAllowOther = true;
    dconf.enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    #viAlias = true;
    #vimAlias = true;
  };

  ### steam
  programs.steam.enable = true;
  hardware.steam-hardware.enable = true;
  programs.gamemode.enable = true;

  ### virtualizations ##########################################################
  virtualisation = {
    libvirtd = { 
      enable = true; 
      qemu = {
        ovmf = {
          enable = true;
          packages = [ pkgs.OVMFFull.fd ];
        };
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection.enable = true;
  };
  programs.virt-manager = {
    enable = true;
    package = pkgs.virt-manager;
  };
  #virtualisation.tpm.enable = true;
  
}
