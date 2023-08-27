{ config, pkgs, lib, ... }:
let
  paths = {
    swww = "${pkgs.swww}/bin/swww";
    awk = "${pkgs.gawk}/bin/awk";
    sed = "${pkgs.gnused}/bin/sed";
    find = "${pkgs.findutils}/bin/find";
    shuf = "${pkgs.coreutils}/bin/shuf";
    head = "${pkgs.coreutils}/bin/shuf";
    wc = "${pkgs.coreutils}/bin/wc";
  };

  change_bg = pkgs.writeShellScript "change_bg" ''
    set -e
    outputs=$(${paths.swww} query | ${paths.awk} '{print $1}' | ${paths.sed} 's|:$||')
    outputs_n=$(echo "$outputs" | ${paths.wc} -l)
    paths=$(${paths.find} "$HOME"/art/bg_$1 -type f -follow | ${paths.shuf} | ${paths.head} -n "$outputs_n")
    i=1
    for j in $outputs; do
        path=$(echo "$paths" | ${paths.sed} -n '''$i'p')
        ${paths.swww} img -o "$j" --transition-type simple --transition-duration 1 --transition-step 4 --transition-fps 60 "$path"
        i=$((i + 1))
    done
  '';
in
{
  environment.systemPackages = [ pkgs.swww pkgs.gawk pkgs.gnused pkgs.findutils pkgs.coreutils ];
  systemd.user = {
    timers."change_bg_safe" = {
      description = "Change safe wp";
      timerConfig = {
        OnActiveSec = 0;
        OnUnitActiveSec = "30min";
      };
      wantedBy = [ "timers.target" ];
    };

    services."change_bg_safe" = {
      description = "Change safe wp";
      serviceConfig = {
        Type = "oneshot";
      };
      # wantedBy = [ "default.target" ];
      script = builtins.readFile change_bg;
      scriptArgs = "safe";
    };
    timers."change_bg_unsafe"  =  {
      description = "Change unsafe wp";
      timerConfig = {
        OnActiveSec = 0;
        OnUnitActiveSec = "30min";
      };
      # wantedBy = [ "timers.target" ];
    };

    services."change_bg_unsafe" = {
      description = "Change unsafe wp";
      serviceConfig = {
        Type = "oneshot";
      };
      # wantedBy = [ "default.target" ];
      script = builtins.readFile change_bg;
      scriptArgs = "unsafe";
    };
  };
}
