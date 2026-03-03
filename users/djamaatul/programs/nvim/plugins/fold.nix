{
  opts = {
    foldlevel = 99;
    foldlevelstart = 99;
    # foldcolumn = "1";
    fillchars = {
      foldopen = "v";
      foldclose = ">";
      foldsep = " ";
    };
    # statuscolumn = "%l%C ";
  };

  plugins.origami = {
    enable = true;
    settings = {
      events = "VeryLazy";
      useLspFoldsWithTreesitterFallback = {
        enabled = true;
        foldmethodIfNeitherIsAvailable = "indent";
      };
      pauseFoldsOnSearch = true;
      autoFold = {
        kinds = [ "comment" "imports" ];
      };
      foldKeymaps = {
        setup = true;
        closeOnlyOnFirstColumn = true;
      };
    };
  };
}
