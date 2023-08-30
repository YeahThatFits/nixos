{ config, pkgs, ... }:


{
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  

  # And ensure gnome-settings-daemon udev rules are enabled 
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];



  #minimal gnome
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome-text-editor
    gnome-connections
    simple-scan
    gnome-usage
    #gnome-console
  ]) ++ 
  (with pkgs.gnome; [
    gnome-calculator
    gnome-system-monitor
    file-roller
    #gnome-disk-utility
    baobab
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


  services.xserver.excludePackages = (with pkgs; [ 
    xterm 
    nano
  ]);

  environment.systemPackages = with pkgs; [

    #gnome shit
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnome.gnome-tweaks
    whitesur-icon-theme
    bibata-cursors-translucent
    
   
    # libraries
    ntfs3g
    linuxHeaders
    linux-firmware
    fakeroot
    alsa-utils
    alsa-firmware

    #utilities
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
    git

    #flatpak
    flatpak
    flatpak-builder

    # asus system 
    asusctl
    supergfxctl
    
    #virtual machines
    virt-manager
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice

   
    
  ];


  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  
  #flatpak shit
  services.flatpak.enable = true;
 

  #virtmanager
  programs.dconf.enable = true;
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;

  #asus system services
  services.asusd.enable = true;
  services.supergfxd.enable = true;
  
  
}
