{ config, pkgs, inputs, username, ... }: {
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
    gnome.gnome-control-center
  ]; 
  gnome-control-center = pkgs.gnome.gnome-control-center.runCommand "${pkgs.gnome.gnome-control-center.name}" { } ''
      cp -R ${pkgs.gnome.gnome-control-center} $out
      chmod -R +w $out
      rm $out/share/applications/gnome-{online-accounts,sharing}-panel.desktop
      find $out -type f -exec sed -i -e "s|${pkgs.gnome.gnome-control-center}|$out|g" {} \;
    '';

}