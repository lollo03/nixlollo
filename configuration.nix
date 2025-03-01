# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./home.nix
    ./sway.nix
    ./pkgs.nix
    ./wg.nix
  ];


  services.xserver.enable = true;
  # You may need to comment out "services.displayManager.gdm.enable = true;"
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  programs.kdeconnect.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixlol"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "it";

  # Configure keymap in X11
  services.xserver.xkb.layout = "it";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  nixpkgs.config.allowUnfree = true;
  programs.xwayland.enable = true;
  programs.light.enable = true;
  services.flatpak.enable = true;

  # Enable sound.
  hardware.pulseaudio.enable = true;
  services.distccd.zeroconf = true;
  hardware.pulseaudio.zeroconf.discovery.enable = true;
  # hardware.pulseaudio.extraConfig = ''
  #   load-module module-native-protocol-tcp auth-anonymous=1
  #   load-module module-zeroconf-discover
  # '';
  services.avahi.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "fletcherm";
      plugins = [
        "git"
        "cp"
      ];
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lollo = {
    isNormalUser = true;
    extraGroups = ["wheel" "video" "networkmanager" "wireshark" "docker"];
    shell = pkgs.zsh;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    jetbrains.jdk
  ];



  services.gnome.gnome-keyring.enable = true;
  services.tailscale.enable = true;
  security.polkit.enable = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["FiraCode" "DroidSansMono" "NerdFontsSymbolsOnly"];})
  ];

  environment.systemPackages = [pkgs.distrobox];

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?
}
