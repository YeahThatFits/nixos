{
  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;  # Easiest to use and most distros use this by default.
    networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    enableIPv6 = true;

    nat = {
      enable = true;
      enableIPv6 = true;
      externalInterface = "enp3s0";
      internalInterfaces = [ "wg0" ];
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 53 ];
      allowedUDPPorts = [ 53 51820 ];
    };

    wg-quick.interfaces = {
      # "wg0" is the network interface name. You can name the interface arbitrarily.
      wg0 = {
        autostart = true;
        configFile = "/etc/nixos/wg_private.conf";
        peers = [{
            persistentKeepalive = 25;
        }];
      };
    };
  };
  
  services.dnsmasq = {
    enable = true;
    extraConfig = ''
      interface=wg0
    '';
  };

  #services.openssh = {
    #enable = true;
    #ports = [ 22552 ];
    #settings = {
      #PermitRootLogin = "no";
      #PasswordAuthentication = false;
      #KbdInteractiveAuthentication = false;
    #};
  #};
}
