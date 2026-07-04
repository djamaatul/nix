{
  opts = {
    foldlevel = 99;
    foldlevelstart = 99;
    fillchars = {
      foldopen = "v";
      foldclose = ">";
      foldsep = " ";
    };
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
