{ pkgs ? import <nixpkgs> {} }:

let
  src = pkgs.fetchFromGitHub {
    owner = "maotseantonio";
    repo = "gtk-themes";
    rev = "a627da499595593af99366203301b363b2dd6576";
    hash = "sha256-2ThCa0gkjs7jFt8BXMJOpXhlNpzKVsx0PJIkgm5Z+eE=";
  };

  mkTheme = themeName: pkgs.stdenv.mkDerivation {
    pname = "maotseantonio-${themeName}";
    version = "1.0";
    inherit src;

    installPhase = ''
      mkdir -p $out/share/themes
      cp -r "$src/${themeName}" "$out/share/themes/${themeName}"
    '';

    meta = with pkgs.lib; {
      description = "GTK theme ${themeName} from maotseantonio/gtk-themes";
      homepage = "https://github.com/maotseantonio/gtk-themes";
      license = licenses.mit;
      platforms = platforms.linux;
    };
  };

in
{
  CatppuccinMocha-zk = mkTheme "CatppuccinMocha-zk";
  OxoCarbon-zk = mkTheme "OxoCarbon-zk";
  TokyoNight-zk = mkTheme "TokyoNight-zk";
}


