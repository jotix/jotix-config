# Hyprland Module

{ config, lib, pkgs, ... }:

{
  options.hyprland.enable = lib.mkEnableOption "Enable OPTION";
  
  config = lib.mkIf(config.hyprland.enable) {

    home.packages = with pkgs; [
      hyprland
      hyprshot
      hyprlock
      hyprlang
      hyprkeys
      hypridle
      hyprshade
      hyprpaper
      hyprpicker
      hyprcursor
      xfce.thunar
      wl-clipboard
      qt6.qtwayland
      swayimg
      rofi-wayland
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      kitty
      numix-gtk-theme
      numix-icon-theme
      numix-cursor-theme
      blueman
      wlr-randr
    ];
    
    xdg.configFile = {
      "hypr/hypridle.conf" = {
        enable = true;
        source = ./dotfiles/hypridle.conf;
      };
      "hypr/hyprlock.conf" = {
        enable = true;
        source = ./dotfiles/hyprlock.conf;
      };
      "hypr/hyprpaper.conf" = {
        enable = true;
        source = ./dotfiles/hyprpaper.conf;
      };
      "hypr/wallpaper.jpg" = {
        enable = true;
        source = ./dotfiles/wallpaper.jpg;
      };
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };
    
    gtk = {
      enable = true;
      cursorTheme = {
        package = pkgs.numix-cursor-theme;
        name = "Numix";
      };
      font = {
        package = pkgs.ubuntu_font_family;
        name = "Ubuntu Condensed";
        size = 10;
      };
      iconTheme = {
        package = pkgs.numix-icon-theme;
        name = "Numix";
      };
      theme = {
        package = pkgs.numix-gtk-theme;
        name = "Numix";
      };
    };
    
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        #monitor=name,resolution,position,scale
        monitor = "monitor=,preferred,auto,auto";
        env = "XCURSOR_SIZE,24";
        input = {
          kb_layout = "us";
          kb_variant = "altgr-intl";
          follow_mouse = 1;
          touchpad = {
            natural_scroll = "no";
          };
          sensitivity = "0 # -1.0 - 1.0, 0 means no modification.";
        };
        exec-once = [ 
          "waybar &"
          "dunst &"
          "hypridle &"
          "hyprpaper &"
        ];
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          layout = "dwindle";
        };
        decoration = {
          rounding = 10;
          drop_shadow = "yes";
          shadow_range = 4;
          shadow_render_power = 3;
          "col.shadow" = "rgba(1a1a1aee)";
        };
        animations = {
          enabled = "yes";
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };
        dwindle = {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = "yes"; # you probably want this
        };
        master = {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = "true";
        };
        gestures = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = "off";
        };
        # window rules
        windowrulev2 = [
          "workspace 2, class:^(firefox)$"
          "workspace 3, class:^(emacs)$"
        ];
        "$mainMod" = "SUPER";
        bind = [
          "$mainMod, return, exec, kitty"
          "$mainMod, X, killactive, "
          "$mainMod SHIFT, x, exit, "
          "$mainMod, H, exec, thunar"
          "$mainMod, V, togglefloating, "
          "$mainMod, D, exec, rofi -show drun"
          "$mainMod, P, pseudo, # dwindle"
          "$mainMod, J, togglesplit, # dwindle"
          # Move focus with mainMod + arrow keys
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          # Switch workspaces with mainMod + [0-9]
          "$mainMod, Q, workspace, 1"
          "$mainMod, W, workspace, 2"
          "$mainMod, E, workspace, 3"
          "$mainMod, R, workspace, 4"
          "$mainMod, T, workspace, 5"
          "$mainMod, Y, workspace, 6"
          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          "$mainMod SHIFT, Q, movetoworkspace, 1"
          "$mainMod SHIFT, W, movetoworkspace, 2"
          "$mainMod SHIFT, E, movetoworkspace, 3"
          "$mainMod SHIFT, R, movetoworkspace, 4"
          "$mainMod SHIFT, T, movetoworkspace, 5"
          "$mainMod SHIFT, Y, movetoworkspace, 6"
          # Scroll through existing workspaces with mainMod + scroll
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
          "$mainMod, F, fullscreen"
          ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          # reload waybar
          "$mainMod SHIFT, B, exec, killall .waybar-wrapped && waybar &"
          # app launchers
          "$mainMod, L, exec, hyprlock"
          "$mainMod, B, exec, firefox"
          "$mainMod, M, exec, emacs"
          # hyprshot
          # Screenshot a window
          "$mainMod, Print, exec, hyprshot -m window"
          # Screenshot a monitor
          ",Print, exec, hyprshot -m output"
          # Screenshot a region
          "$mainMod SHIFT, Print, exec, hyprshot -m region"
        ];
        bindm = [
          # Move/resize windows with mainMod + LMB/RMB and dragging
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
      };
      
      
    };
  };
}
