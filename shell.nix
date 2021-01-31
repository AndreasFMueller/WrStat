with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    gnumake 
    texlive.combined.scheme-full 
  ];
}
