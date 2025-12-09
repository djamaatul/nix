{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      color.ui = true;
      init = {
        defaultBranch = "main";
      };
      fetch = {
        prune = true;
      };
      code = {
        editor = "vim";
      };
      user = {
        email = "djamaatul.anbiya@gmail.com";
        name = "D. Jamaatul Anbiya";
      };
    };
  };
}
