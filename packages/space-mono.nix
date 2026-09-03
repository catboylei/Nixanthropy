{ fetchFromGitHub, stdenvNoCC, lib }:
stdenvNoCC.mkDerivation (finalAttrs: {
	pname = "space-mono";
	version = "1.0";

	src = fetchFromGitHub {
		owner = "googlefonts";
		repo = "spacemono";
		rev = "329858c2c4dbd3476f972a4ae00624b018cf4b81";
		hash = "sha256-qIeq90N3Mh8MBeZZp1QfBj33zTQNiv8k2vec1nFrdNY=";
	};

	installPhase = ''
		runHook preInstall

		install -D -m 444 fonts/ttf/*.ttf -t $out/share/fonts/ttf

		runHook postInstall
	'';

	meta = {
		description = "space-mono font";
		license = lib.licenses.ofl;
	};
})
