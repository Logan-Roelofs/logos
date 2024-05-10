{
  description = "Logan's NixOs configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    ags.url = "github:Aylur/ags";
    hyprland.url = "git+https://github.com/andresilva/Hyprland?ref=nix-build-improvements&submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      username = "logan";
      system = "x86_64-linux";
    in{
      # Logos NixOs configuration
      nixosConfigurations.logos = nixpkgs.lib.nixosSystem {
        pkgs = import nixpkgs { inherit system; };
        specialArgs = { inherit inputs username; };
        extraSpecialArgs = { inherit inputs username; };
        modules = [
          ./hardware/hardware-configuration.nix 
          ./modules/default.nix 
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home.nix;
            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };
}
