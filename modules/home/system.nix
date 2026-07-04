{ config, pkgs, ... }: {

  programs.alacritty.package = config.lib.nixGL.wrap pkgs.alacritty;
}
