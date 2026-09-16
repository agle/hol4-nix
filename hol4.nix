{
  stdenv,
  fetchFromGitHub,

  mlton,
  polyml,
}:

stdenv.mkDerivation {
  pname = "hol4";
  version = "trindemossen-2-v6";

  src = fetchFromGitHub {
    owner = "HOL-Theorem-Prover";
    repo = "HOL";
    rev = "trindemossen-2-v6";
    hash = "sha256-TFkwDI/5o6WbF7XTz2U/0qLr9Xk9qb1JNoKjsDurUi0=";
  };

  buildInputs = [
    mlton
    polyml
  ];
  propagatedBuildInputs = [ polyml ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/holdir
    cp -r ./* $out/holdir
    cd $out/holdir
    poly < tools/smart-configure.sml
    bin/build --no-helpdocs # helpdoc build is broken
    cp -r bin $out/bin
  '';

}
