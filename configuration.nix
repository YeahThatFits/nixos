{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./hardware.nix
      ./network.nix
      ./packages.nix
      ./users.nix
      ./environment.nix
      ./graphical_environment.nix
      ./sound.nix
      ./time_locale.nix
      ./systemd_change_bg.nix
      
   ];

  system.copySystemConfiguration = true;
  system.stateVersion = "23.05";
}
