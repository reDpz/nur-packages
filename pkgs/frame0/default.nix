{ stdenv
, fetchurl
, binutils
, libarchive
, gtk3
, nss
, libnotify
, libXtst
, xdg-utils
, at-spi2-core
, mesa
, libdrm
, libxcb
, glib
, alsa-lib
, libgcc
, autoPatchelfHook
}:

stdenv.mkDerivation rec {
  name = "frame0";
  version = "1.0.0~beta.8";
  src = fetchurl {
    url = "https://files.frame0.app/releases/linux/x64/frame0_${version}_amd64.deb";
    hash = "sha256-3vDG0Yw0OUdwjZiRfwULLVhqTI8HrJcSooW0eyQup9g=";
  };

  nativeBuildInputs = [ binutils libarchive ];
  buildInputs = [
    gtk3
    nss
    libnotify
    libXtst
    xdg-utils
    at-spi2-core
    libdrm
    mesa
    libxcb
    alsa-lib
    libgcc
    glib
    autoPatchelfHook
  ];

  dontAutoPatchelf = false;

  unpackPhase = ''
    # Extract the .deb file using `ar`
    ar x $src
    bsdtar -xf data.tar.xz 
  '';

  installPhase = ''
    mkdir -p $out/bin $out/share
    cp -r usr/* $out/
  '';

}
