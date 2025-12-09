{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 4;
          y = 4;
        };
        dynamic_padding = true;
        decorations = "Buttonless";
        opacity = 0.2;
        blur = true;
        startup_mode = "Windowed";
        dynamic_title = true;
        option_as_alt = "OnlyLeft";
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
