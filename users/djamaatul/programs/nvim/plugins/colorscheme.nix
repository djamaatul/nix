{
  colorschemes.kanagawa = {
    enable = true;
    settings = {
      transparent = true;
      theme = "dragon";
      overrides = ''
        function(colors)
          return {
            LineNr = { fg = colors.theme.ui.special, bg = "none" },
            CursorLineNr = { fg = colors.theme.ui.special, bg = "none" },
            WinSeparator = { fg = colors.theme.ui.special, bg = "none" },
          }
        end
      '';
    };
  };
}
