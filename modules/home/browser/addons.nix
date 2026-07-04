{ buildFirefoxXpiAddon, lib }:

{
  translation = buildFirefoxXpiAddon rec {
    pname = "simple-translate";
    version = "3.0.0";
    sha256 = "c9e36d1d8e32a223da367bdc83133f2436103eb5f16460c7cce2096376e78b68";
    url = "https://addons.mozilla.org/firefox/downloads/file/4286113/simple_translate-${version}.xpi";
    addonId = "{42a72358-1cdf-48c4-83bf-d6deae68aa47}";
    meta = with lib;
      {
        homepage = "https://simple-translate.sienori.com";
        description = "Quickly translate selected text on web page. In toolbar popup, you can translate input text.";
        license = licenses.mpl20;
        mozPermissions = [
          "<all_urls>"
          "tabs"
          "webNavigation"
          "storage"
          "mozillaAddons"
          "contextMenus"
        ];
        platforms = platforms.all;
      };
  };
}
