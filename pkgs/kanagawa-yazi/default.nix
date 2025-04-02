{
  fetchFromGithub,
  stdenvNoCC,
  lib,
}:
stdenvNoCC.mkDerivation {
  name = "kanagawa-yazi";
  version = "1.0.0";
  src = fetchFromGithub {
    owner = "dangooddd";
    repo = "kanagawa.yazi";
    rev = "31167ed54c9cc935b2fa448d64d367b1e5a1105d";
    hash = lib.fakeHash;
  };

  meta = with lib; {
    homepage = "https://github.com/dangooddd/kanagawa.yazi";
    description = "kanagawa.yazi flavour";
    platforms = platforms.all;
  };
}
