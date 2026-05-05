{ config, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix ];

  # Boot (UEFI - recomendado)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Recife";
  i18n.defaultLocale = "pt_BR.UTF-8";

  # usuário
  users.users.bart = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  security.sudo.enable = true;

  # Hyprland (Wayland)
  programs.hyprland.enable = true;

  # login automático simples (sem display manager pesado)
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "Hyprland";
      user = "bart";
    };
  };

  # som (necessário pro volume funcionar)
  services.pipewire.enable = true;

  # pacotes MINIMOS que você pediu
  environment.systemPackages = with pkgs; [
    vscode
    kitty
    nano
    git
    wget
    firefox
  ];

  system.stateVersion = "25.11";
}