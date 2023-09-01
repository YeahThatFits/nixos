{
  boot.loader = {
    grub.enable = true;
    grub.device = "nodev";
    grub.useOSProber = true;
    grub.efiSupport = true;
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  fileSystems."/media/ext2" =
    { noCheck = true;
      options = [ "uid=1000" "gid=1000" ];
    };

  fileSystems."/media/ext1" =
    { noCheck = true;
      options = [ "uid=1000" "gid=1000" ];
    };

  fileSystems."/media/win1" =
    { device = "/dev/disk/by-uuid/C4A6BC42A6BC3730";
      fsType = "ntfs";
    };

  fileSystems."/media/win2" =
    { device = "/dev/disk/by-uuid/9A629A3C629A1CD7";
      fsType = "ntfs";
    };

  powerManagement.cpuFreqGovernor = "performance";

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    # package = ... # select version
    forceFullCompositionPipeline = false;
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Bluetooth
  # hardware.bluetooth.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
