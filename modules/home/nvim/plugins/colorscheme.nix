{
  plugins.transparent = {
    enable = true;
    settings = {
      exclude_groups = [ "CursorLine" "CursorLineNr" ];
    };
  };
  colorschemes.kanagawa = {
    enable = true;
    settings = {
      theme = "wave";
      background = {
        dark = "dragon";
      };
      colors = {
        theme = {
          all = { ui = { bg_gutter = "none"; }; };
        };
      };
    };
  };
}
