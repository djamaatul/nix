{ nixgl, ... }: {
  targets.genericLinux.nixGL = { packages = nixgl.packages; };

  imports = [
    ../../modules/home/system.nix
  ];
}
