
{
    description = "hyperion OS configuration";

    inputs = {
        flake-parts.url = "github:hercules-ci/flake-parts";
        nixpkgs.url = "nixpkgs/nixos-24.11";

        gaming.url = "git+ssh://git.computeroid.org/xand-dotfiles/gaming";
        xand.url = "git+ssh://git.computeroid.org/xand-dotfiles/xand";
        xmonad.url = "git+ssh://git.computeroid.org/xand-dotfiles/xmonad";
    };

    outputs = {flake-parts, ...} @ inputs:
        flake-parts.lib.mkFlake { inherit inputs; } {
            imports = [
                ./nixos
            ];

            systems = [
                "x86_64-linux"
            ];
        };
}