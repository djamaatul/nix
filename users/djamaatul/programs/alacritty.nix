{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        # padding = {
        #   x = 10;
        #   y = 10;
        # };
        dynamic_padding = true;
        decorations = "Buttonless";
        opacity = 0.6;
        blur = true;
        startup_mode = "Maximized";
        dynamic_title = true;
        option_as_alt = "OnlyLeft";
      };
      font = {
        normal = { family = "FiraCode Nerd Font"; style = "Regular"; };
        bold   = { family = "FiraCode Nerd Font"; style = "Bold"; };
        italic = { family = "FiraCode Nerd Font"; style = "Italic"; };
        size = 13.0;
      };
    };
    settings = {
      terminal = {
        shell = "${pkgs.fish}/bin/fish";
        osc52 = "CopyPaste";
      };
      mouse = {
        bindings = [
          { mouse = "Right"; mods = "Control"; action = "ExpandSelection"; }
        ];
      };
    };
  };
}
