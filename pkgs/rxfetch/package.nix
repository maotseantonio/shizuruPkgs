{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  gitUpdater,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "nerdfetch";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "maotseantonio";
    repo = "rxfetch";
    rev = "99b598ff81f722159c187ac996d11c34673778ff";
    hash = "sha256-Aw3UOQfk0mluMhv8WwxUj+TAHVBWzaTpZpZe281A4k0=";
   };
  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;
  installPhase = ''
    mkdir -p $out/bin
      cp $src/rxfetch $out/bin
  '';

  passthru.updateScript = gitUpdater {
    rev-prefix = "v";
  };

  meta = with lib; {
    description = "custom system fetching tool writing in bash";
    homepage = "https://github.com/maotseantonio/rxfetch";
    maintainers = with maintainers; [ByteSudoer];
    license = licenses.mit;
    mainProgram = "rxfetch";
    platforms = platforms.unix;
  };
})
