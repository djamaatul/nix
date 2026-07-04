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
      DontCheckDefaultBrowser = false;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = true;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
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
          simple-translate
        ];
      };

      settings = {
        "extensions.autoDisableScopes" = 0;
        "browser.ctrlTab.sortByRecentlyUsed" = true;
        "browser.tabs.warnOnClose" = false;
        "browser.warnOnQuit" = false;
        "browser.translations.automaticallyPopup" = true;
        "zen.view.compact.enable-at-startup" = true;
        "zen.view.compact.hide-toolbar" = true;
        "zen.workspaces.continue-where-left-off" = true;
        "zen.theme.content-element-separation" = 0;
        "layout.css.prefers.color.scheme.content.override" = 0;
        "ui.systemUsesDarkTheme" = 1;
      };
    };
  };
}
