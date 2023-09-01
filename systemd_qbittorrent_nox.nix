{ config, pkgs, lib, ... }:
{
  environment.systemPackages = [ pkgs.qbittorrent-nox ];
  systemd = {
    services."qbittorrent" = {
      description = "qbittorrent headless server";
      documentation = [ "man:qbittorrent-nox(1)" ];
      serviceConfig = {
        Type = "simple";
        PrivateTmp = "false";
        Restart = "on-failure";      # Restart the service if it fails
        RestartSec = "1min";        # Wait for 10 minutes before restarting
        ExecStart = "${pkgs.qbittorrent-nox}/bin/qbittorrent-nox";
        TimeoutStopSec = 1800;
        User = "1000";
      };
      after = [ "network-online.target" "local-fs.target" "nss-lookup.target" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];
      startLimitIntervalSec = 0;  # Disable start rate limiting
    };
  };
}
