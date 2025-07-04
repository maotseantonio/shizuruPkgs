{ stdenvNoCC
, lib
, makeWrapper
, appimage-run
, fetchurl
}:

stdenvNoCC.mkDerivation {
  pname = "houdoku-appimage";
  version = "2.16.0";

  src = fetchurl {
    url = "https://github.com/maotseantonio/shizuruPkgs/releases/download/v1.0/houdoku.tar.gz";
    sha256 = "7bd7fb4c0da5e33673a225d346de06d469a2445c7fd9d96a723311c5d8ddc0d0";
  };

  nativeBuildInputs = [ makeWrapper ];

  unpackPhase = ''
    mkdir -p $TMPDIR/source
    tar -xzf $src -C $TMPDIR/source
  '';

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/applications
    mkdir -p $out/share/icons/hicolor/512x512/apps

    cp $TMPDIR/source/houdoku/Houdoku-2.16.0.AppImage $out/

    makeWrapper ${appimage-run}/bin/appimage-run $out/bin/houdoku \
      --add-flags $out/Houdoku-2.16.0.AppImage

    cat > $out/share/applications/houdoku.desktop <<EOF
[Desktop Entry]
Name=Houdoku
Comment=Houdoku Manga Reader
Exec=$out/bin/houdoku
Icon=houdoku
Type=Application
Categories=Graphics;Viewer;
EOF

    if [ -f $TMPDIR/source/houdoku/houdoku.png ]; then
      cp $TMPDIR/source/houdoku/houdoku.png $out/share/icons/hicolor/512x512/apps/houdoku.png
    fi
  '';

  meta = {
    description = "Houdoku manga reader AppImage wrapped for NixOS";
    homepage = "https://houdoku.org/";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
}
