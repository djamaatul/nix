{ config, pkgs, inputs, ... }:
let
  sdkPath = "${config.home.homeDirectory}/.android/sdk";

  devicesXml = pkgs.writeText "devices.xml" ''
    <?xml version="1.0" encoding="UTF-8"?>
    <d:devices xmlns:d="http://schemas.android.com/sdk/devices/7"
               xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    </d:devices>
  '';

  systemImageName = "system-images-android-34-google-apis-playstore-x86-64";

  systemImage =
    let
      orig = pkgs.androidSdkPackages.${systemImageName};
    in
    pkgs.runCommandLocal systemImageName
      {
        passthru = orig.passthru;
        inherit (orig) pname version;
      } ''
      mkdir -p $out
      cp -as ${orig}/. $out/
      chmod u+w $out
      cp ${devicesXml} $out/devices.xml
    '';

  packages = pkgs.androidSdkPackages // {
    ${systemImageName} = systemImage;
  };

  androidSdk =
    (pkgs.callPackage "${inputs.android-nixpkgs.outPath}/pkgs/android/sdk.nix" { inherit packages; })
      (sdk: with sdk; [
        build-tools-34-0-0
        cmdline-tools-22-0
        emulator
        platform-tools
        platforms-android-34
        sources-android-34
        sdk.${systemImageName}
      ]);

  sdkRoot = "${androidSdk}/share/android-sdk";

  avdmanagerWrapper = pkgs.writeShellScript "avdmanager" ''
    ${sdkRoot}/cmdline-tools/22.0/bin/avdmanager "$@"
    rc=$?
    if [ "$1" = "create" ]; then
      for cfg in "''${ANDROID_AVD_HOME:-$HOME/.android/avd}"/*.avd/config.ini; do
        [ -f "$cfg" ] || continue
        if grep -q 'google_apis_playstore' "$cfg"; then
          sed -i 's/^PlayStore\.enabled=no$/PlayStore.enabled=yes/' "$cfg"
        fi
      done
    fi
    exit $rc
  '';
in
{
  home.file.${sdkPath}.source = sdkRoot;

  home.file.".local/share/android-tools/bin/avdmanager".source = avdmanagerWrapper;

  home.sessionVariables = {
    ANDROID_HOME = sdkPath;
    ANDROID_SDK_ROOT = sdkPath;
    ANDROID_USER_HOME = "${config.home.homeDirectory}/.android";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/share/android-tools/bin"
    "${sdkPath}/platform-tools"
    "${sdkPath}/cmdline-tools/22.0/bin"
    "${sdkPath}/emulator"
  ];
}
