### EXWM Module

{ config, lib, pkgs, ... }:

{
  options.exwm.enable = lib.mkEnableOption "Enable EXWM";
  
  config = lib.mkIf(config.exwm.enable) {

    services.xserver.windowManager.exwm = {
      enable = true;
      loadScript = ''(load-file "~/.config/emacs/exwm.el")'';
      extraPackages = (epkgs: (with epkgs; [
        dmenu
        bluetooth
        pinentry

        vertico
        marginalia
        consult
        orderless
        multiple-cursors
        dashboard
        nerd-icons
        all-the-icons
        all-the-icons-dired
        spacemacs-theme
        spaceline
        vterm
        rainbow-delimiters
        which-key
        beacon
        hungry-delete
        sudo-edit
        nix-mode
        undo-tree
        org-auto-tangle
        org-bullets
        toc-org
        magit
        eshell-git-prompt
        company
        treemacs
        org-present
        visual-fill-column
        geiser
        geiser-guile
        dmenu
        eshell-info-banner
        ace-window
      ]));
    };
    
  };
}
