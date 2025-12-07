
{ pkgs, config, ... }:

{

  networking.hostName = "nixos";
  services.openssh.enable = true;

}
