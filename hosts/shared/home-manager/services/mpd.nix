{ ... }: {
	services.mpd = {
		enable = true;

		network.startWhenNeeded = true;
		musicDirectory = "/home/lei/Music/";
		extraConfig = ''
            auto_update "yes"
          
            audio_output {
      	  type "pipewire"
      	  name "pipewireout"
            }
    '';
	};
	services.mpd-mpris.enable = true;
}
