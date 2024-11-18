{
  description = "Personal collection of scripts used on a number of devices.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system} = {
        default = pkgs.stdenv.mkDerivation {
          name = "cora-scripts";
          src = ./.;

          installPhase = ''
            mkdir -p $out/bin
            find . -type f -name "*.sh" -exec cp {} $out/bin
            find $out/bin -type f -exec chmod +x {}
          '';
        };
      };
    };
}
