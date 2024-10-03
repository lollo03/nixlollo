{pkgs, ...}: let
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in {
  users.users.lollo.packages = with pkgs; [
    firefox
    tree
    kitty
    vim
    bitwarden-desktop
    clipman
    unstable.neovim
    git
    gh
    pulseaudio
    avahi
    pavucontrol
    nssmdns
    telegram-desktop
    owncloud-client
    fastfetch
    spotify
    xwayland
    #
    # nvim
    #
    nodejs
    glow # md previewer
    tree-sitter # for nvim

    # lsp
    clang # clang
    clang-tools # C, C++
    lua-language-server # lua
    marksman # markdown
    matlab-language-server # matlab
    nil # nix
    nodePackages_latest.bash-language-server # bash
    pyright # python
    rust-analyzer # rust
    shellcheck # checks shell scripts
    yaml-language-server # yaml

    # formatters
    alejandra # nix
    beautysh # sh
    black # python
    codespell # spell check
    glow # md previewer
    isort # python
    jq # json
    nodePackages_latest.prettier # prettier
    python311Packages.mdformat # python
    stylua # lua
    taplo # toml
    tree-sitter # for nvim
  ];
}
