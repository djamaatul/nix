{ nixgl, ... }:
{
  programs = {
    fish.enable = true;
  };

  targets.genericLinux.nixGL = { packages = nixgl.packages; };
  targets.darwin.linkApps.enable = true;

  imports = [
    ../../modules/linux/sway.nix
    ../../modules/linux/system.nix
    ../../modules/linux/dms.nix
  ];

}
