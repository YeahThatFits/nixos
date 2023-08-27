{ config, pkgs, ... }:

{
  users.mutableUsers = false;
  # mkpasswd
  users.users.root.hashedPassword = "$y$j9T$jNNA0ypXSyA5w/mJuVEv40$47Nj8hIM95QdQdUFQGdO9Cf/m8DTKun2WFIeDuOzYuC";
  users.groups = {
    sabo.gid = 1000;
  };
  users.users.sabo = {
    hashedPassword = "$y$j9T$ZJNqt.Mr7MiOpsgfbGGRt.$7IzejPdTbEOT6sYAvIUB2P/Ro.54nJJIRR1kw0Zhvt1";
    isNormalUser = true;
    home = "/home/sabo";
    shell = pkgs.zsh;
    uid = 1000;
    group = "sabo";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    # packages = with pkgs; [
    #   firefox
    #   tree
    # ];
  };

  # sudo
  security.sudo = {
    enable = true;
    extraRules = [{
      commands = [
        {
        command = "${pkgs.systemd}/bin/systemctl suspend";
        options = [ "NOPASSWD" ];
        }
        {
        command = "${pkgs.systemd}/bin/reboot";
        options = [ "NOPASSWD" ];
        }
        {
        command = "${pkgs.systemd}/bin/poweroff";
        options = [ "NOPASSWD" ];
        }
      ];
      groups = [ "wheel" ];
    }];
  };
}
