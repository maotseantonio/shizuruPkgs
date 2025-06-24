{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "kureiji-ollie-cursor";
  version = "v2";

  src = pkgs.fetchFromGitHub {
      owner = "maotseantonio";
      repo = "Kureiji-Ollie-Cursors";
      rev = "a74edd1054b1fa1334e54276c9163ab69e7293f0";
      hash = "sha256-IXrG0LgO62UXtHsLHTzV03IBVm/gUw1iY0T4NlW67k0=";
   };

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r Kureiji-Ollie-v2 $out/share/icons/
  '';

  meta = with pkgs.lib; {
    description = "Kureiji Ollie v2 custom cursor theme";
    homepage = "https://github.com/maotseantonio/Kureiji-Ollie-Cursors";
    license = licenses.free;
    platforms = platforms.all;
  };
}


