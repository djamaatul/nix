{
  programs.kitty = {
    enable = true;

    shellIntegration.enableFishIntegration = true;
    enableGitIntegration = true;

    keybindings = {};

    settings = {
      macos_option_as_alt = "yes";

      font_family = "FiraCode Nerd Font Mono";

      hide_window_decorations = "yes";
      window_padding_width = "10";
      titlebar-and-corners = "yes";

      mouse_hide_wait = ".1";

      tab_bar_edge = "htop";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_bar_min_tabs = 1;

      background_opacity = 0.80;
      background_blur = 20;

    };
  };

}
