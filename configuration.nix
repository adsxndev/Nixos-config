{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader - systemd-boot para UEFI
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Hostname
  networking.hostName = "nixos";

  # Rede
  networking.networkManager.enable = true;

  # Time zone
  time.timeZone = "America/Sao_Paulo";

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  
  # Console - VERSÃO CORRIGIDA
  console.keyMap = "us";
  console.font = "Lat2-Terminus16";

  # Usuário (opcional)
  users.users.nixos = {
    isNormalUser = true;
    initialPassword = "nixos";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Senha do root (caso não queira criar usuário)
  users.users.root.initialPassword = "nixos";

  # SSH
  services.openssh.enable = true;

  # Versão do sistema
  system.stateVersion = "24.11";
}
