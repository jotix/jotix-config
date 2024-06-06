# default configuration

{ pkgs, ... }:

{
  imports = [
    ./hyprland.nix
  ];
  
  nix = {
    package = pkgs.nixFlakes; # or versioned attributes like nixVersions.nix_2_8
    extraOptions = ''experimental-features = nix-command flakes'';
  };

  nixpkgs.config.allowUnfree = true;

  #security.pam.services.swaylock = {};

  system.stateVersion = "23.11";

  ### graphics drivers ########################################################
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  ### boot #####################################################################
  boot = {
    # kernel version
    kernelPackages = pkgs.linuxKernel.packages.linux_6_8;

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
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  
  # services.displayManager.sddm = {
  #   enable = true;
  #   wayland.enable = true;
  #   autoNumlock = true;
  # };
  
  # services.desktopManager.plasma6.enable = true;

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
    mpv
    htop
    fuse
    wl-clipboard
    virtiofsd
    gparted
    spotify      
    gimp
    firefox
    google-chrome
    eza
    lazygit
    powerline-go
    zoxide
    python3
    bat
    gnome.gnome-tweaks
    gnome.cheese
    gnomeExtensions.tiling-assistant
    (import ./emacs.nix { inherit pkgs; })
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    fira-code
    fira-code-nerdfont
  ];

  programs.git.enable = true;

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
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
