{ pkgs, ... }:
{
  plugins.lazygit = {
    enable = true;
    settings = {
      use_custom_config_file_path = 1;
      config_file_path = "${pkgs.writeText "config.yml" ''
        quitOnTopLevelReturn: true
      ''}";
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = ":LazyGit<cr>";
    }
    {
      mode = "n";
      key = "<leader>gf";
      action = ":LazyGitFilterCurrentFile<cr>";
    }
  ];
}
