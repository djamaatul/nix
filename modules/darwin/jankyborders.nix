{ pkgs, ... }:

{
  services.jankyborders = {
    enable = true;
    width = 1.0;
    hidpi = true;
    inactive_color = "0x00000000";
  };
}
