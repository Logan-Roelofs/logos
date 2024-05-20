{ pkgs, inputs, ...}:

{
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/classic-dark.yaml";
  #stylix.base16Scheme ={
  #  base00 = "1d2021";
  #  base01 = "3c3836";
  #  base02 = "504945";
  #  base03 = "665c54";
  #  base04 = "bdae93";
  #  base05 = "d5c4a1";
  #  base06 = "ebdbb2";
  #  base07 = "fbf1c7";
  #  base08 = "fb4934";
  #  base09 = "fe8019";
  #  base0A = "fabd2f";
  #  base0B = "b8bb26";
  #  base0C = "8ec07c";
  #  base0D = "83a598";
  #  base0E = "d3869b";
  #  base0F = "d65d0e";
  #};
  stylix.autoEnable = true;
  stylix.image = ../dotfiles/wp/zen.png;
  stylix.targets.gtk.enable = false;
  stylix.polarity = "dark";
  gtk = {
    enable = true;
    theme.package = pkgs.adw-gtk3;
    theme.name = "adw-gtk3-dark";
  };
}
