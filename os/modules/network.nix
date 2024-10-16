{ config, pkgs, inputs, username, ... }: {

  networking.nat.enable = true;
  networking.resolvconf.enable = true;
  networking.firewall.checkReversePath = "strict"; # or "false"
  networking.hostName = "NixOS";
  networking.networkmanager.enable = true;
  networking.extraHosts = ''
    10.10.11.230 cozyhosting.htb
  '';
  users.users.${username} = {
    extraGroups = [ "networkmanager" "wheel" ];
  };
  networking.firewall.enable = false;
  environment.systemPackages = with pkgs; [
    gtk3
    wireguard-tools
    wg-bond
    wg-netmanager
    gnome.gnome-control-center
    networkmanager-openvpn
    gnome.networkmanager-openvpn
  ];
  networking.wg-quick.interfaces = {
    wg-proton.configFile = "/home/logan/.config/logos/dotfiles/vpn/wg-proton-US-FREE-285032.conf" 
  };
}