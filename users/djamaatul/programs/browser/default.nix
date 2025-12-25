{ pkgs, inputs, ... }:

{
  programs.zen-browser = {
    enable = true;

    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisableFirefoxAccount = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      Extensions = {
        Install = [ "https://addons.mozilla.org/firefox/downloads/file/4286113/simple_translate-3.0.0.xpi" ];
      };
      ExtensionSettings = {
        "3rdparty" = {
          "Extensions" = { };
        };
      };
    };

    profiles.default = {
      isDefault = true;

      extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          privacy-badger
          ublock-origin
        ];
      };

      settings = {
        "extensions.autoDisableScopes" = 0;
        "browser.ctrlTab.sortByRecentlyUsed" = true;
        "browser.tabs.warnOnClose" = false;
        "browser.warnOnQuit" = false;
        "zen.view.compact.enable-at-startup" = true;
        "zen.view.compact.hide-toolbar" = true;
        "zen.view.compact.toolbar-flash-popup" = true;
        "zen.workspaces.continue-where-left-off" = true;
      };
    };
  };
}
