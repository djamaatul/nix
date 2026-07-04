{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        dynamic_padding = true;
        decorations = "none";
        opacity = 0.6;
        startup_mode = "Maximized";
      };

      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
        size = 12;
      };

      terminal.shell = {
        program = "fish";
      };
    };
  };
}
