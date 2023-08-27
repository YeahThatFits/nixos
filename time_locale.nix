{ config, pkgs, ... }:

{
  time.timeZone = "Europe/Helsinki";

  i18n.defaultLocale = "en_US.UTF-8";
  console = { 
  font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services.xserver.extraLayouts.us_edit = {
    description = "Custom US layout";
    languages = [ "eng" ];
    symbolsFile = pkgs.writeText "us_edit" ''
    default partial alphanumeric_keys
    xkb_symbols "basic" {
      include "us"

      name[Group1]= "English (US, finnish)";
      include "level3(ralt_switch)"
      key <AC01> {[ a, A, adiaeresis, Adiaeresis ]};
      key <AD09> {[ o, O, odiaeresis, Odiaeresis ]};
      key <AB06> {[ n, N, ntilde, Ntilde ]};
      key <AD01> {[ q, Q, section ]};
      key <AD07> {[ u, U, sterling ]};
      key <AD06> {[ y, Y, yen ]};
      key <AD03> {[ e, E, EuroSign ]};
      key <AB03> {[ c, C, currency ]};
      key <AC04> {[ f, F, thorn ]};
      key <AD10> {[ p, P, paragraph ]};
    };'';
  };
}
