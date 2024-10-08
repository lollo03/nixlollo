{pkgs, ...}: {
  # Sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      grim # screenshots
      libnotify # notification library
      mako # notification daemon
      rofi-wayland # launcher
      sov # workspaces content
      swaybg # bg
      swayidle # idle control
      swaylock # lock command
      wf-recorder # screen recording
      wl-clipboard # access to system buffer
      xwayland # non wayland compatibility
      brightnessctl
      light
      pamixer
      waybar
    ];
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=xcb
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';
  };

  # Screen sharing sway
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };
}
