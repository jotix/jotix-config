### Waybar Module

{ config, lib, ... }:

let
  waybarStyle = builtins.readFile( ./style.css );
in
{
  options.waybar.enable = lib.mkEnableOption "Enable Waybar Home";
  
  config = lib.mkIf(config.waybar.enable) {

    programs.waybar = {
      enable = true;
      settings = {

        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          output = [ "HDMI-A-1" ];
	        modules-left = [
		        "hyprland/mode"
		        "hyprland/workspaces"
		        "hyprland/window"
	        ];
          modules-center = [ "clock" ];
          modules-right = [
		        "pulseaudio"
		        "network"
		        "memory"
		        "cpu"
		        "temperature"
	        ];
          clock = {
					  timezone = "America/Argentina/Buenos_Aires";
            format = "{:%A, %B %d, %Y (%R)}";
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            calendar = {
              mode           = "year";
              mode-mon-col   = 3;
              weeks-pos      = "right";
              on-scroll      = 1;
              on-click-right = "mode";
              format = {
                months   = "<span color='#ffead3'><b>{}</b></span>";
                days     = "<span color='#ecc6d9'><b>{}</b></span>";
                weeks    = "<span color='#99ffdd'><b>W{}</b></span>";
                weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                today    = "<span color='#ff6699'><b><u>{}</u></b></span>";
              };
            };
            actions =  {
              on-click-forward = "tz_up";
              on-click-backward = "tz_down";
              on-scroll-up = "shift_up";
              on-scroll-down = "shift_down";
            };
          };
	        cpu = {
		        interval = 5;
		        tooltip = false;
		        format = "CPU {usage}%";
		        format-alt = "CPU {load}";
		        states = {
			        warning = 70;
			        critical = 90;
		        };
	        };
	        memory = {
		        interval = 5;
		        format = "Disk {used:0.1f}G/{total:0.1f}G";
		        states = {
			        warning = 70;
			        critical = 90;
		        };
		        tooltip = false;
	        };
	        network = {
		        interval = 5;
		        format-wifi = "Net {essid} ({signalStrength}%)";
		        format-ethernet = "{ifname}";
		        format-disconnected = "No connection";
		        format-alt = "{ipaddr}/{cidr}";
		        tooltip = false;
	        };
	        "hyprland/mode" = {
		        format = "{}";
		        tooltip = false;
	        };
	        "hyprland/window" = {
		        format = "{}";
		        max-length = 30;
		        tooltip = false;
	        };
          "hyprland/workspaces" = {
		        disable-scroll-wraparound = true;
		        smooth-scrolling-threshold = 4;
		        enable-bar-scroll = true;
		        format = "  {name}  ";
	        };
	        pulseaudio = {
		        format = "Vol {volume}%";
		        format-bluetooth = "BT {volume}%";
		        format-muted = "Vol";
		        scroll-step = 1;
		        on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
		        tooltip = false;
	        };
	        temperature = {
		        critical-threshold = 90;
		        interval = 5;
		        format = "Temp {temperatureC}°";
		        tooltip = false;
	        };
        };
      };

      style = waybarStyle;
    };

    
  };
  
}
