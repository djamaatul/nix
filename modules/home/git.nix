{ name, email }:

{ pkgs, ... }: {
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
        editor = "${pkgs.neovim}/bin/nvim";
      };
      user = {
        inherit name;
        inherit email;
      };
      credential.helper = "store";
    };
  };
}
