{ flake-parts-lib, lib, inputs, ... }:

let
    inherit (inputs.nixpkgs.lib) nixosSystem;
in
{
    flake = {
        nixosConfigurations.hyperion = nixosSystem {
            modules = [
                ./configuration.nix
                inputs.gaming.nixosModules.gaming
                inputs.xand.nixosModules.xand
                inputs.xmonad.nixosModules.xmonad
            ];
        };
    };
}