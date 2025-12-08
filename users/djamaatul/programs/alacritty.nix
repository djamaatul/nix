{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 20;
          y = 10;
        };
        dynamic_padding = true;
        decorations = "Buttonless";
        opacity = 0.5;
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
    };
  };
}
