# default configuration

{ pkgs, lib, ... }:

{
  imports = [
    ./home-manager.nix
    ./hardware.nix
    ./modules/default.nix
  ];
 
  nix.settings.experimental-features = [ "nix-command" "flakes" "pipe-operators"];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05";

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
  boot.loader = {
    systemd-boot.enable = true;
    systemd-boot.consoleMode = "auto";
    efi.canTouchEfiVariables = true;
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
      gitroot = "cd $(git rev-parse --show-toplevel)";
      gr = "gitroot";
      google_drive_upload = "rclone copy ~/Documents jujodeve:";
      gdu = "google_drive_upload";
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

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "bak";
  
  ### servicess ################################################################

  ### pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  }; 
 
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
    google-chrome
    rclone
    libreoffice
    inkscape
    python3
    ventoy-full
    transmission_3
    transmission_3-qt
    ghostscript
    rose-pine-icon-theme
    numix-cursor-theme
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
    viAlias = true;
    vimAlias = true;
  };

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
