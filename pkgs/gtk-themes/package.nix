{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "maotseantonio-gtk-themes";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
       owner = "maotseantonio";
       repo = "gtk-themes";
       rev = "a627da499595593af99366203301b363b2dd6576";
       hash = "sha256-2ThCa0gkjs7jFt8BXMJOpXhlNpzKVsx0PJIkgm5Z+eE=";
  };
 
  installPhase = ''
    mkdir -p $out/share/themes
    for theme in CatppuccinMocha-zk OxoCarbon-zk TokyoNight-zk; do
      cp -r "$theme" "$out/share/themes/"
    done
  '';

  meta = with pkgs.lib; {
    description = "Custom GTK themes: CatppuccinMocha-zk, OxoCarbon-zk, TokyoNight-zk";
    homepage = "https://github.com/maotseantonio/gtk-themes";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}

