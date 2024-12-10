{
  description = "Thalin's darwin/home-manager config flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zenix = {
      # url = "github:thalin/zenix-modules";
      url = "path:/Users/thalin/projects/zenix-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = inputs:
  inputs.snowfall-lib.mkFlake {
    inherit inputs;
    src = ./.;

    # Configure Snowfall Lib, all of these settings are optional.
    snowfall = {
      # Choose a namespace to use for your flake's packages, library,
      # and overlays.
      namespace = "snowfoundry";
    };

    channels-config = {
      allowUnfree = true;
    };
    
    homes.modules = with inputs; [
      zenix.homeModules.zenix
      stylix.homeManagerModules.stylix
    ];
  };
}
