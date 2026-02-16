{ config, pkgs, lib, ... }: {

  wayland.windowManager.sway = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.swayfx;
    checkConfig = false;

    extraConfig = ''
      blur enable
      blur_xray disable
      blur_passes 2
      blur_radius 2

      for_window [title=".*Picture-in-Picture$"] floating enable, border pixel 1
      for_window [title="^Pritunl.*"] floating enable, border pixel 1
    '';

    config = {
      modifier = "Mod4";

      terminal = "alacritty";

      gaps.inner = 10;
      window.titlebar = false;

      bars = [ ];

      startup = [
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
          natural_scroll = "enable";
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
