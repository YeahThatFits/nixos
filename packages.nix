{ config, pkgs, ... }:



{
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  


  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];



  #minimal gnome
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome-text-editor
    gnome-connections
    simple-scan
    gnome-usage
    gnome-console
  ]) ++ 
  (with pkgs.gnome; [
    gnome-calculator
    gnome-system-monitor
    file-roller
    gnome-disk-utility
    gnome-logs
    seahorse
    eog
    gnome-maps
    gnome-font-viewer
    yelp
    gnome-calendar
    gnome-contacts
    cheese # webcam tool
    gnome-music
    gnome-terminal
    gnome-software
    gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    gnome-weather 
    gnome-clocks
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);
  services.xserver.excludePackages = [ 
    pkgs.xterm 
    pkgs.nano
  ];

  environment.systemPackages = with pkgs; [

    #gnome shit
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnome.gnome-tweaks
    whitesur-icon-theme
    whitesur-gtk-theme
   
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

    #flatpak
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
    #nodejs_20
    
    # agnostic
    git

    
  ];

  #programs.steam = {
    #enable = true;
    #remotePlay.openFirewall = true;
    #dedicatedServer.openFirewall = true;
  #};

  
  #flatpak shit
  services.flatpak.enable = true;
 



  services.asusd.enable = true;
  services.supergfxd.enable = true;
  
  
}
