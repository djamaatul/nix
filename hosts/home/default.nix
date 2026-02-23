{ nixgl, pkgs, ... }:
{
  programs = {
    fish.enable = true;
  };

  targets.genericLinux.nixGL = pkgs.lib.mkIf pkgs.stdenv.isLinux { packages = nixgl.packages; };
  targets.darwin.linkApps.enable = pkgs.lib.mkIf pkgs.stdenv.isDarwin true;

  imports = [
    ../../modules/linux/sway.nix
    ../../modules/linux/system.nix
    ../../modules/linux/dms.nix
  ];

}
