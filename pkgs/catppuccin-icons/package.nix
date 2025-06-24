{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "catppuccin-icons";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
     owner = "maotseantonio";
     repo = "catppuccin-icons";
     rev = "70a8fbc51cbd5961a680491678d5e657020de4ee";
     hash = "sha256-uOUDcSViPpMi3HJk5Q/6HSHtQNa0B2IGjacwZ52ICVk=";
   };
  installPhase = ''
    mkdir -p $out/share/icons
    cp -r Catppuccin-SE $out/share/icons/
  '';

  meta = with pkgs.lib; {
    description = "Catppuccin-SE icon theme";
    homepage = "https://github.com/catppuccin/catppuccin-icon-theme";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}


