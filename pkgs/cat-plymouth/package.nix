{ stdenvNoCC
, lib
, fetchFromGitHub
, unstableGitUpdater
}:

let
  pname = "plymouth-catppuccin-mocha-mod";
  version = "2024-03-12";
  themeName = "catppuccin-mocha-mod";
in

stdenvNoCC.mkDerivation {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "maotseantonio";
    repo = "cat-plymouth";
    rev = "376e1af49591cc1f7f4f84e989353c2c47e1955c";
    hash = "sha256-JYBuN38eD06oUSmrMJHPaHUB8MJUu9HJe8CwaMrgJ88=";
  };

  # Adjust sourceRoot if your themes are inside a subfolder; else omit or adjust
  sourceRoot = "source/${themeName}";

  installPhase = ''
    runHook preInstall

    # Patch ImageDir to $out path
    sed -i "s|^ImageDir=.*$|ImageDir=$out/share/plymouth/themes/${themeName}|" ${themeName}.plymouth

    mkdir -p $out/share/plymouth/themes/${themeName}
    cp -r * $out/share/plymouth/themes/${themeName}

    runHook postInstall
  '';

  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "Catppuccin Mocha Mod Plymouth theme by maotseantonio";
    homepage = "https://github.com/maotseantonio/cat-plymouth";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ ];
  };
}
