{ stdenv, fetchFromGitHub, plymouth }:

stdenv.mkDerivation {
  pname = "plymouth-catppuccin-mocha";
  version = "2024-03-12"; # You can update this as needed

  src = fetchFromGitHub {
    owner = "maotseantonio";
    repo = "cat-plymouth";
    rev = "f9691a4b89c16c058ddf5087a11bf6556514cf18";
    hash = "sha256-aPK/WOcydCturZ04datxOfNxTTr3qEQJS5oV+4IHAhc=";
  };

  installPhase = ''
    mkdir -p $out/share/plymouth/themes/catppuccin-mocha-mod
    cp -r * $out/share/plymouth/themes/catppuccin-mocha-mod
  '';

  meta = with stdenv.lib; {
    description = "Catppuccin Mocha Plymouth theme from maotseantonio/cat-plymouth";
    homepage = "https://github.com/maotseantonio/cat-plymouth";
    license = licenses.mit; # Adjust if your repo uses a different license
    platforms = platforms.linux;
  };
}
