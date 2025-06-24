{ pkgs, lib, hyprland }:

let
  inherit (builtins) fromTOML readFile fetchGit head elemAt substring;

  hyprpm = fromTOML (readFile ./hyprpm.toml);
  commitPins = hyprpm.repository.commit_pins;

  hyprlandRev = hyprland.rev or throw "Missing hyprland.rev";

  hyprscrollerRev =
    let
      match = builtins.filter (pair: head pair == hyprlandRev) commitPins;
    in if match != [] then
      elemAt (head match) 1
    else
      throw "No hyprscroller commit found for Hyprland rev ${hyprlandRev}";

  shortRev = substring 0 7 hyprscrollerRev;

  version = "hyprscroller-${shortRev}";

  src = fetchGit {
    url = "https://github.com/cpiber/hyprscroller";
    rev = hyprscrollerRev;
  };

  buildScript = hyprpm.hyprscroller.build or [ "make" ];
  outputFile = hyprpm.hyprscroller.output or "hyprscroller.so";

in

pkgs.stdenv.mkDerivation {
  pname = "hyprscroller";
  inherit version src;

  nativeBuildInputs = [
    pkgs.cmake
    pkgs.pkg-config
    pkgs.gcc14
  ];

  buildInputs = [ hyprland ] ++ (hyprland.buildInputs or []);

  buildPhase = lib.concatStringsSep "\n" buildScript;

  installPhase = ''
    mkdir -p $out/lib
    cp ./${outputFile} $out/lib/libhyprscroller.so
  '';

  meta = with lib; {
    description = hyprpm.hyprscroller.description or "Hyprland layout plugin like PaperWM";
    homepage = "https://github.com/cpiber/hyprscroller";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    platforms = platforms.linux;
  };
}
