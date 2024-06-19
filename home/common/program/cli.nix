{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # secrets related
    age
    sops
    openssl
    gnupg

    # archive
    rar
    zip
    xz
    unzip
    p7zip

    # git
    git
    gitleaks
    gh

    # networking tools
    mtr
    iperf3
    dnsutils # dig + dnslookup
    ldns
    socat
    nmap
    ipcalc
    aria2
    curl
    wget
    httpie

    # utils
    fzf
    ripgrep
    jq
    tokei
    bat
    fd
    trash-cli
    xcp
    eza
    yq-go
    tmux

    # resource stat
    du-dust
    duf
    gdu
    procs
    bottom
    htop
    btop
    iotop
    iftop

    # containerization utils
    kubectl
    kubectx
    lazydocker
    k9s

    # media (audio, screen, etc)
    alsa-utils
    brightnessctl

    # misc
    neofetch
    file
    which
    gnused
    gnutar
    gawk
    zstd

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # sensors
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  programs.atuin = {
    enable = true;
    settings = {
      enter_accept = false;
      style = "compact";
    };
  };

  programs.autojump = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userEmail = "labasubagia22@gmail.com";
    userName = "Laba Subagia";
  };
}
