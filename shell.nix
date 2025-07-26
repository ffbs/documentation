{ pkgs ? import <nixpkgs> {} }:
let
    python-with-my-packages = pkgs.python3.withPackages (p: with p; [
      sphinx
      sphinxcontrib-nwdiag
      sphinxcontrib-seqdiag
    ]);
in
  pkgs.mkShell {
    packages = [
      python-with-my-packages 
    ];
  }
