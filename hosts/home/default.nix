
{ pkgs, config, ... }:

{

  networking.hostName = "linux";
  services.openssh.enable = true;

}
