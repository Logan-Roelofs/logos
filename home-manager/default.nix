{ lib, pkgs, inputs, username, neovim-config, ... }:
let
  hyprlandConfig = import ./hyprland.nix { inherit lib pkgs inputs; };
#  agsConfig = import ./ags.nix { inherit lib pkgs inputs asztal; };
  themeConfig = import ./theme.nix { inherit lib pkgs inputs; };
  neovimConfig = import ./neovim.nix { inherit lib pkgs inputs; };
  firefoxConfig = import ./firefox.nix { inherit lib pkgs inputs; };
in
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.05";

 home.packages = with pkgs; [ proximity-sort ];
  programs.neovim = {
    enable = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = with pkgs; [ imagemagick gcc ];
    withNodeJs = true;
  };

  # Import the Hyprland configuration
  imports = [
    hyprlandConfig
    #agsConfig
    themeConfig
    firefoxConfig
  ];

}
