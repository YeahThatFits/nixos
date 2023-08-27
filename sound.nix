{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  services.mpd = {
    enable = true;
    musicDirectory = "/media/ext1/music";
    extraConfig = ''
    db_file "/home/sabo/.config/mpd/database"
    # auto_update "yes"
    # restore_paused "yes"
    playlist_directory	"/home/sabo/.config/mpd/playlists"
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
    network.listenAddress = "any";
  };
  services.mpd.user = "sabo";
  systemd.services.mpd.environment = {
      # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
      XDG_RUNTIME_DIR = "/run/user/1000"; # User-id 1000 must match above user. MPD will look inside this directory for the PipeWire socket.
  };
}
