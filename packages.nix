{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # gui
    vivaldi
    vivaldi-ffmpeg-codecs
    keepassxc
    sioyek
    pavucontrol
    mpv
    mcomix
    geogebra
    feh
    chatterino2

    # terminal
    kitty
    tmux
    qbittorrent-nox

    # tui
    vim
    neovim
    ranger
    htop
    newsboat
    (ncmpcpp.override { visualizerSupport = true; })
    ncdu

    # libraries
    poppler
    ntfs3g
    linuxHeaders
    linux-firmware
    fakeroot
    alsa-utils
    alsa-firmware

    # network
    nettools
    nmap
    sshfs
    netcat-gnu
    wireguard-tools
    openssh

    # terminal utilities
    streamlink
    wget
    unzip
    time
    socat
    rsync
    ripgrep
    fzf
    neofetch
    mpc-cli
    mlocate
    inotify-tools
    groff
    ffmpegthumbnailer
    jellyfin-ffmpeg
    fd
    dialog
    bat
    which
    p7zip
    atool
    unrar
    odt2txt
    xlsx2csv
    jq
    mediainfo
    imagemagick
    python311Packages.fontforge
    neovim-remote
    libnotify
    woeusb
    flatpak
    flatpak-builder

    # system utilities
    efibootmgr
    os-prober
    light
    wev
    xorg.xev
    xorg.xrandr
    upower
    pulseaudio

    # wayland utilities
    mako
    swaylock
    slurp
    grim
    swww
    wl-clipboard
    cliphist
    eww-wayland
    hyprpicker
    wlr-randr
    dmenu-wayland

    # fonts
    font-awesome
    nerdfonts
    ipafont
    paratype-pt-sans
    liberation_ttf

    # !!!!!!!!!!!!!!! #
    # dev environment #
    # !!!!!!!!!!!!!!! #

    # c
    valgrind
    gcc
    gnumake
    cmake
    bear
    ccls
    cgdb
    astyle

    # rust
    rustc
    cargo
    rust-analyzer

    # lua
    luajitPackages.luarocks-nix

    # haskell
    # haskellPackages.ghcup

    # perl
    perl

    # python
    python39
    python311Packages.pip

    # awk
    mawk
    
    # java
    jre8

    # javascript
    nodejs_20
    
    # latex
    texlive.combined.scheme-small
    biber
    bison

    # go
    go

    # json

    # agnostic
    git
    gnupatch
    ctags
    tree-sitter
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  
  services.flatpak.enable = true;

}
