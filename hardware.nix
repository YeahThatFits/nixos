{
  boot.loader = {
    grub.enable = true;
    grub.device = "nodev";
    grub.useOSProber = true;
    grub.efiSupport = true;
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  #fileSystems."/media/ext2" =
    #{ noCheck = true;
    #};

  #fileSystems."/media/ext1" =
    #{ noCheck = true;
    #};

  powerManagement.cpuFreqGovernor = "balanced";

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
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Bluetooth
  # hardware.bluetooth.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
}
