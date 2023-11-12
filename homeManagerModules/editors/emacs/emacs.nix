### Emacs Module

{ config, lib, pkgs, ... }:

{
  options.emacs.enable = lib.mkEnableOption "Enable Emacs";

  config = lib.mkIf(config.emacs.enable) {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs29;
      extraPackages = epkgs: with epkgs; [
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
        sly
        treemacs
        org-present
        visual-fill-column
        geiser
        geiser-guile
      ];
    };

    services.emacs = {
      enable = true;
      client.enable = true;
      client.arguments = [
        "-c"
        "-a emacs"
      ];
    };

    xdg.configFile = {
      "emacs/init.el" = {
        enable = true;
        source = ./init.el;
      };
      "emacs/eshell/alias" = {
        enable = true;
        source = ./alias;
      };
      "emacs/eshell/profile" = {
        enable = true;
        source = ./profile;
      };
    };
  };
}
