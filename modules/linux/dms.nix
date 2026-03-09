{
  programs.dank-material-shell = {
    enable = true;

    settings = {
      currentThemeName = "dynamic";
      currentThemeCategory = "dynamic";
      barConfigs = [
        {
          id = "default";
          name = "Main Bar";
          enabled = true;
          position = 0;
          screenPreferences = [
            "all"
          ];
          showOnLastDisplay = true;
          leftWidgets = [
            "launcherButton"
            {
              id = "workspaceSwitcher";
              enabled = true;
            }
            "focusedWindow"
          ];
          centerWidgets = [
            "music"
            "clock"
            "weather"
          ];
          rightWidgets = [
            "systemTray"
            "clipboard"
            "cpuUsage"
            "memUsage"
            "notificationButton"
            "battery"
            "controlCenterButton"
          ];
          spacing = 17;
          innerPadding = 4;
          bottomGap = 0;
          transparency = 0.8;
          widgetTransparency = 0;
          squareCorners = true;
          noBackground = false;
          gothCornersEnabled = false;
          gothCornerRadiusOverride = false;
          gothCornerRadiusValue = 12;
          borderEnabled = true;
          borderColor = "surfaceText";
          borderOpacity = 0.3;
          borderThickness = 1;
          fontScale = 1;
          autoHide = false;
          autoHideDelay = 250;
          openOnOverview = false;
          visible = true;
          popupGapsAuto = true;
          popupGapsManual = 4;
          scrollYBehavior = "workspace";
          widgetOutlineEnabled = false;
        }
      ];
    };
  };
}


