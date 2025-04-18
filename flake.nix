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
             find . -type f ! -path './.git/*' ! -name 'Makefile' ! -name 'flake.*' -exec cp {} $out/bin \; -exec chmod +x $out/bin \;
           '';
         };
       };
     };
 }
