{
  description = "waybar configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    waybar.url = "github:Alexays/Waybar";
  };

  outputs =
    {
      nixpkgs,
      flake-parts,
      waybar,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      perSystem =
        {
          system,
          pkgs,
          self',
          lib,
          ...
        }:
        {
          formatter = pkgs.nixfmt-rfc-style;

          packages = {
            default = waybar;
          };
        };
    };
}
