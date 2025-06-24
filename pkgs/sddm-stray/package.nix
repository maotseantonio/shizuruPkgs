{ lib
, stdenvNoCC
, fetchFromGitHub
, kdePackages
, formats
}:

stdenvNoCC.mkDerivation rec {
  pname = "sddm-theme-stray";
  version = "1.0";

  src = fetchFromGitHub { 
    owner = "Bqrry4";
    repo = "sddm-stray";
    rev = "299b6d6473fa1880ae94b12233f9233b0e4dbf02";
    hash = "sha256-g/K0Ep0NkSDl4SdGHoqqZydGR6F8GoqYggz37rp8Oc8=";
  };

  dontWrapQtApps = true;

  propagatedBuildInputs = [
    kdePackages.qtsvg
    kdePackages.qtmultimedia
  ];

  buildPhase = ''
    runHook preBuild
    echo "No build step needed."
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    themeDir="$out/share/sddm/themes/sddm-theme-stray"
    install -dm755 "$themeDir"

    cp -r "$src/theme/"* "$themeDir"
 
    runHook postInstall
  '';

  postFixup = ''
    mkdir -p $out/nix-support
    echo ${kdePackages.qtsvg} >> $out/nix-support/propagated-user-env-packages
    echo ${kdePackages.qtmultimedia} >> $out/nix-support/propagated-user-env-packages
  '';

  meta = with lib; {
    description = "Stray SDDM theme from Bqrry4/sddm-stray";
    homepage = "https://github.com/Bqrry4/sddm-stray";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}

