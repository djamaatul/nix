{ config, pkgs, lib, ... }: {

  wayland.windowManager.sway = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.swayfx;
    checkConfig = false;

    extraConfig = ''
      blur enable
      blur_xray disable
      blur_passes 2
      blur_radius 1

      # corner_radius 10

      for_window [title=".*Picture-in-Picture$"] floating enable, border pixel 1
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

      bars = [ ];

      startup = [
        # {
        #   command = "dms run";
        # }
        # {
        #   command = "wl-paste --watch cliphist store";
        # }
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
