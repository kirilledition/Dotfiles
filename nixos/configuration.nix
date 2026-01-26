# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    #      ./tailscale-ssh.nix
  ];

  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  boot.loader = {
    timeout = 20;
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      gfxmodeEfi = "2560x1440";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "lighthouse"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Cinnamon Desktop Environment.
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.desktopManager.cinnamon.enable = true;
  # services.xserver.displayManager.lightdm.greeters.gtk = {
  #   cursorTheme = {
  #     package = pkgs.banana-cursor;
  #     name = "Banana";
  #   };
  # };

  # Enable the COSMIC login manager
  services.displayManager.cosmic-greeter.enable = true;

  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.motd = "no gods or kings only man";
  users.users.kirill = {
    isNormalUser = true;
    description = "Kirill";
    extraGroups = ["networkmanager" "wheel" "docker"];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRF9XFFxQB7Qk8MOomo0CHdd+FlbwtPkcZ6NF7XHRh5QvDoaIoAPvYb44nWKFijc+hXypsysNVBTloPWtYwgc/+tHPvWZcUdh+1psy/RkHxkhLeyhNB8CpIGc7wiCbbDxTGpqq9hP0j/+AHOv7NOYQDdFNY/jXrXreQN9VlbvCGjzvJqRggqicvrc50yr2VccBPLbNt3od/FnFHafcT4/PZHFtNGMd+sCUSvlKg4d+yVfaf7vN9HpwlZatCGjPjW3DUV3zxErzSPK8apTfSP1dWY16EDgUjE9SkOPu7HqyL5CYMKHDPima2nbfbcetnE15D5PKAoXTIPA3o4PRay9R6CxGagBXEUY0hsGZmBgTgZEjkU6xIJmLGgdu2WZqRyfz4IJZLEDHP6M20k3vzhVmvJJkf5UMzjy6GCKgqma04rUjWJ07LMucUvyXe6tAwUh9+0LxNjzyryGxKfOIuguIR6ZHN71Un30umM4dcKW4zt/Qmk+3eA76VBUQXsgGsE8="
    ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  environment.shells = [pkgs.zsh];

  # Install firefox.
  programs.firefox.enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    micro
    vscode
    fastfetch
    _1password-cli
    _1password-gui
    obs-studio
    bat
    lsd
    eza
    ripgrep
    btop
    zoxide
    starship
    fzf
    kitty
    duf
    dust
    git
    stow
    tailscale
    ticktick
    obsidian
    mpv
    zoom-us
    audacity
    nodejs_25
    ffmpeg-full
    # banana-cursor
    gh
    alejandra
    onlyoffice-desktopeditors
    libreoffice-qt
    hunspell
    hunspellDicts.ru_RU
    hunspellDicts.en_US
    tealdeer
    google-chrome
    inputs.ghostty.packages.x86_64-linux.default
    antigravity
  ];
  nixpkgs.overlays = [
    (final: prev: {
      btop = prev.btop.override {
        cudaSupport = true;
      };
    })
  ];
  programs.thunderbird.enable = true;
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = ["kirill"];
  };

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        google-chrome
      '';
      mode = "0755";
    };
  };

  # Enable OpenGL
  hardware.graphics.enable = true;

  # Load nvidia driver for Xorg and Wayland
  nixpkgs.config.nvidia.acceptLicense = true;
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  hardware.nvidia-container-toolkit.enable = true;

  virtualisation.docker = {
    enable = true;
  };

  services.tailscale.enable = true;
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.PermitRootLogin = "yes";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    jetbrains-mono
  ];

  programs.nano.enable = false;

  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults pwfeedback
    '';
  };
  programs.nix-ld.enable = true;

  systemd.user = {
    paths.vscode-remote-workaround = {
      wantedBy = ["default.target"];
      pathConfig.PathChanged = "%h/.vscode-server/bin";
    };
    services.vscode-remote-workaround.script = ''
      for i in ~/.vscode-server/bin/*; do
        if [ -e $i/node ]; then
          echo "Fixing vscode-server in $i..."
          ln -sf ${pkgs.nodejs_25}/bin/node $i/node
        fi
      done
    '';
  };

  programs.ssh = {
    # enable = true;
    extraConfig = ''
      Host *
      IdentityAgent ~/.1password/agent.sock
    '';
  };

  # console = {
  #   earlySetup = true;
  #   font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
  #   packages = with pkgs; [terminus_font];
  #   keyMap = "us";
  # };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "sapphire";
    cursors = {
      enable = true;
      flavor = "mocha";
      accent = "sapphire";
    };
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
