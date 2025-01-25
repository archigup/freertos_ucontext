{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flakelight.url = "github:nix-community/flakelight";
  };
  outputs = { flakelight, ... }@inputs:
    flakelight ./. {
      inherit inputs;
      devShell = {
        packages = pkgs: with pkgs; [ clang-tools ];
        shellHook = "export MAKEFLAGS=-j$(nproc)";
      };
    };
}
