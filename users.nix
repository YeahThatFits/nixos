{ config, pkgs, ... }:

{
  users.mutableUsers = true;
  # mkpasswd
  users.groups = {
    samuel.gid = 1000;
  };
  users.users.samuel = {
    isNormalUser = true;
    home = "/home/samuel";
    shell = pkgs.zsh;
    uid = 1000;
    group = "samuel";
    extraGroups = [ "wheel" "networkmanager" "libvirtd" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
        flatpak
        gnome.gnome-software
    ];
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
