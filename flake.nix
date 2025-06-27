{
  description = "waybar configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    snowfall = {
      url = "github:snowfallorg/lib/dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.snowfall.mkFlake {
      inherit inputs;
      src = ./.;

      overlay-package-namespace = "snowfallorg";

      alias.packages.default = "waybar";
    };
}
