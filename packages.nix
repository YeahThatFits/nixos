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
    #gnome-console
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

  environment.systemPackages = [

    #gnome shit
    pkgs.gnomeExtensions.appindicator
    pkgs.gnomeExtensions.dash-to-dock
    pkgs.gnomeExtensions.blur-my-shell
    pkgs.gnome.gnome-tweaks
    pkgs.whitesur-icon-theme
    pkgs.bibata-cursors-translucent
    
   
    # libraries
    pkgs.ntfs3g
    pkgs.linuxHeaders
    pkgs.linux-firmware
    pkgs.fakeroot
    pkgs.alsa-utils
    pkgs.alsa-firmware

    # terminal utilities
    pkgs.streamlink
    pkgs.wget
    pkgs.unzip
    pkgs.time
    pkgs.socat
    pkgs.rsync
    pkgs.ripgrep
    pkgs.fzf
    pkgs.neofetch
    pkgs.mpc-cli
    pkgs.mlocate
    pkgs.inotify-tools
    pkgs.groff
    pkgs.ffmpegthumbnailer
    pkgs.jellyfin-ffmpeg
    pkgs.fd
    pkgs.dialog
    pkgs.bat
    pkgs.which
    pkgs.poppler_utils
    pkgs.p7zip
    pkgs.atool
    pkgs.unrar
    pkgs.odt2txt
    pkgs.xlsx2csv
    pkgs.jq
    pkgs.mediainfo
    pkgs.imagemagick
    pkgs.libnotify

    #flatpak
    pkgs.flatpak
    pkgs.flatpak-builder

    # system utilities
    pkgs.asusctl
    pkgs.supergfxctl
    
    
    # !!!!!!!!!!!!!!! #
    # dev environment #
    # !!!!!!!!!!!!!!! #
  
    pkgs.git
    


  ];

 





  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  
  #flatpak shit
  services.flatpak.enable = true;
 


 
  services.asusd.enable = true;
  services.supergfxd.enable = true;
  
  
}
