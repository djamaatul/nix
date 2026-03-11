{ config, pkgs, lib, ... }: {

  home.packages = with pkgs; [ swaybg swayidle ];

  services.swayidle = {
    enable = true;
    systemdTarget = "graphical-session.target";
    timeouts = [
      {
        timeout = 200;
        command = "${pkgs.swayfx}/bin/swaymsg 'output * power off'";
        resumeCommand = "${pkgs.swayfx}/bin/swaymsg 'output * power on'";
      }
      {
        timeout = 600;
        command = "systemctl suspend";
      }
    ];
  };

  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];

        margin-left = 15;
        margin-right = 15;
        margin-top = 15;

        modules-left = [ "sway/workspaces" "sway/mode" "sway/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "battery" ];

        battery = {
          format = "battery: {capacity}%";
        };

        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%F %T}";
          interval = 1;
        };

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
      }
    ];
    style = ''
      * {
        border: none;
      }
      
      #waybar {
        background-color: rgba(0,0,0,0.5);
        border: 1px solid rgba(255,255,255,0.5);
      }

      #window {
        color: white;
      }

      #battery {
        margin: 10px;
        color: white;
      }

      #clock {
        color: white;
      }

      #workspaces {
        margin: 5px 10px;
        color: white;
      }

      #workspaces button {
        border: 1px solid white;
        border-radius: 0px;
        color: white;
        min-width: 0;
        padding: 0px;
        margin: 10px 5px;
      }

      #workspaces button.focused {
        background-color: white;
        color: black;
      }
    '';
  };
  wayland.windowManager.sway = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.swayfx;
    checkConfig = false;

    extraConfig = ''
      blur enable
      blur_xray disable
      blur_passes 2
      blur_radius 1

      #corner_radius 10

      for_window [title=".*Picture-in-Picture$"] floating enable, sticky enable, border pixel 1
      for_window [title="^Pritunl.*"] floating enable, border pixel 1
    '';

    config = {
      modifier = "Mod4";

      terminal = "alacritty";

      gaps = {
        outer = 5;
        inner = 10;
        # smartBorders = "on";
        # smartGaps = "on";
      };

      window = {
        titlebar = false;
        border = 1;
      };

      colors = {
        focused = {
          border = "#555555";
          background = "#555555";
          childBorder = "#555555";
          indicator = "#555555";
          text = "#ffffff";
        };
        unfocused = {
          border = "#333333";
          background = "#333333";
          childBorder = "#333333";
          indicator = "#292d2e";
          text = "#888888";
        };
        focusedInactive = {
          background = "#333333";
          border = "#333333";
          childBorder = "#333333";
          indicator = "#484e50";
          text = "#ffffff";
        };
      };

      bars = [
        # {
        #   command = "waybar";
        # }
      ];

      startup = [
        # {
        #   command = "sh ${./swaybg.sh}";
        #   always = true;
        # }

        {
          command = "dms run";
        }
        {
          command = "wl-paste --watch cliphist store";
        }
      ];

      keybindings =
        let
          mod = config.wayland.windowManager.sway.config.modifier;
        in
        lib.mkOptionDefault {
          "${mod}+q" = "kill";
          "Mod1+Space" = "exec dms ipc call spotlight toggle";

          "XF86AudioRaiseVolume" = "exec dms ipc call audio increment 3";
          "XF86AudioLowerVolume" = "exec dms ipc call audio decrement 3";

          "XF86MonBrightnessUp" = ''exec dms ipc call brightness increment 5 ""'';
          "XF86MonBrightnessDown" = ''exec dms ipc call brightness decrement 5 ""'';

          "Print" = "exec dms screenshot";
          "XF86AudioMute" = "exec dms ipc call audio mute";
        };

      input = {
        "type:touchpad" = {
          tap = "enabled";
          dwt = "enabled";
          natural_scroll = "enabled";
          drag_lock = "disable";
        };
        "type:keyboard" = {
          xkb_options = "caps:escape";
          repeat_delay = "200";
          repeat_rate = "50";
        };
      };
    };
  };
}
