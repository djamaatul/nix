{ nixgl, ... }:
{
  programs = {
    fish.enable = true;
  };

  targets.genericLinux.nixGL = { packages = nixgl.packages; };

  imports = [
    ../../modules/linux/sway.nix
    ../../modules/linux/system.nix
    ../../modules/linux/dms.nix
  ];

}
