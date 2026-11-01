{ nixgl, ... }: {
  targets.genericLinux.nixGL = { packages = nixgl.packages; };

  imports = [
    ../../modules/home/system.nix
    ../../modules/home/android-emulator.nix
  ];
}
