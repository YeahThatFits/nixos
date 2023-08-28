{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget


  #exclude garbage from gnome
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ 
  (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    #gnome-terminal
    #gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);



  environment.systemPackages = with pkgs; [
   
    # libraries
    ntfs3g
    linuxHeaders
    linux-firmware
    fakeroot
    alsa-utils
    alsa-firmware

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
    poppler_utils
    p7zip
    atool
    unrar
    odt2txt
    xlsx2csv
    jq
    mediainfo
    imagemagick
    libnotify
    flatpak
    flatpak-builder

    # system utilities
    asusctl
    supergfxctl
    auto-cpufreq

    # !!!!!!!!!!!!!!! #
    # dev environment #
    # !!!!!!!!!!!!!!! #

    # rust
    rustc
    cargo
    rust-analyzer

    # python
    conda

    # javascript
    nodejs_20
    
    # agnostic
    git

    
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  
  services.flatpak.enable = true;
  services.asusd.enable = true;
  services.supergfxd.enable = true;

}
