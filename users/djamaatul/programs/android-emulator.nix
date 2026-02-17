{ pkgs, config, ... }:
let

  android_sdk = pkgs.androidenv.emulateApp {
    name = "start";
    platformVersion = "34";
    abiVersion = "x86_64";
    systemImageType = "google_apis_playstore";
    configOptions = {
      "hw.ramSize" = "4096";
      "hw.gpu.enabled" = "no";
      "hw.audio.input" = "yes";
      "hw.keyboard" = "yes";
      "hw.camera.front" = "virtualscene";
    };
  };
in
{
  nixpkgs.config.android_sdk.accept_license = true;

  home.packages = [
    (config.lib.nixGL.wrap android_sdk)
    pkgs.androidenv.androidPkgs.platform-tools
  ];
}

