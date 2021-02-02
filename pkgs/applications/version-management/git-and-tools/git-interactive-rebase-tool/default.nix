{ lib, stdenv, fetchFromGitHub, rustPlatform, libiconv, Security }:

rustPlatform.buildRustPackage rec {
  pname = "git-interactive-rebase-tool";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "MitMaro";
    repo = pname;
    # https://github.com/MitMaro/git-interactive-rebase-tool/issues/419
    rev = "76efeedbb94c35cd1b613393f7554f074348608b";
    sha256 = "sha256-QYSAvM6bklI0+Ol0ujfsEk9NivUJk5r2TdvwFieJvdE=";
  };

  cargoSha256 = "051llwk9swq03xdqwyj0hlyv2ywq2f1cnks95nygyy393q7v930x";

  buildInputs = lib.optionals stdenv.isDarwin [ libiconv Security ];

  # external_editor::tests::* tests fail
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/MitMaro/git-interactive-rebase-tool";
    description = "Native cross platform full feature terminal based sequence editor for git interactive rebase";
    changelog = "https://github.com/MitMaro/git-interactive-rebase-tool/releases/tag/${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ masaeedu zowoq ];
  };
}
