{ ... }:

{
  networking.hostName = "nixos";
  services.openssh.enable = true;

  home-manager.users.djamaatul.imports = [
    ../../modules/home/sway.nix
    ../../modules/home/dms.nix
  ];

  home-manager.users.root.imports = [
    ../../modules/home/core.nix
  ];
}
