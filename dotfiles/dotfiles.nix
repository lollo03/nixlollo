{
  # Config
  xdg.configFile = {
    "sway" = {
      recursive = true;
      source = ./sway;
      target = "sway";
    };
    "kitty" = {
      source = ./kitty;
      target = "kitty";
    };
    "nvim" = {
      recursive = true;
      source = ./nvim;
      target = "nvim";
    };
    "waybar" = {
      recursive = true;
      source = ./waybar;
      target = "waybar";
    };
    "swaylock" = {
      source = ./swaylock;
      target = "swaylock";
    };
    "mako" = {
      source = ./mako;
      target = "mako";
    };
  };
}
