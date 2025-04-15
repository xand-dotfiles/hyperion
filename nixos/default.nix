{ flake-parts-lib, lib, inputs, ... }:

let
    inherit (inputs.nixpkgs.lib) nixosSystem;

    hyperion = nixosSystem {
        modules = [
            ./configuration.nix
            inputs.gaming.nixosModules.gaming
            inputs.xand.nixosModules.xand
            inputs.xmonad.nixosModules.xmonad
        ];
    };

    hyperionWithVr = nixosSystem {
        modules = [
            ./configuration.nix
            inputs.gaming.nixosModules.gaming
            inputs.gaming.nixosModules.vr
            inputs.xand.nixosModules.xand
            inputs.xmonad.nixosModules.xmonad
        ];
    };

    nixosConfigurations = {
        inherit hyperion hyperionWithVr;
        default = hyperion;
    };
in
{
    flake = {
        inherit nixosConfigurations;
    };
}