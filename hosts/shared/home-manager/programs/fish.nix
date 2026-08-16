{ ... }: {
	programs.fish = {
		enable = true;

		interactiveShellInit = let
			default = "ffceff";
			default_dark = "fc25fc";
			default_darker = "aa00aa";
			default_contrast = "ffffce";
			error = "ff0000";
			suggestions = "9a7e9a";
		in ''
      set fish_greeting

      set -g fish_color_normal ${default}
      set -g fish_color_command ${default}
      set -g fish_color_keyword ${default} --bold
      set -g fish_color_quote ${default_dark}
      set -g fish_color_redirection ${default}
      set -g fish_color_end ${default}
      set -g fish_color_error ${error}
      set -g fish_color_param ${default_dark}
      set -g fish_color_option ${default_darker}  # flags
      set -g fish_color_comment ${suggestions}
      set -g fish_color_selection ${default}
      set -g fish_color_operator ${default_dark}
      set -g fish_color_escape ${default_contrast}
      set -g fish_color_autosuggestion ${suggestions}
      set -g fish_color_cwd ${default_dark}
      set -g fish_color_cwd_root ${default_dark}
      set -g fish_color_user ${default}
      set -g fish_color_host ${default}
      set -g fish_color_host_remote ${default}
      set -g fish_color_cancel ${default}
      set -g fish_color_search_match ${default}
      set -g fish_color_valid_path ${default}
      set -g fish_pager_color_progress ${suggestions}
      set -g fish_pager_color_prefix ${default_dark}
      set -g fish_pager_color_completion ${suggestions}
      set -g fish_pager_color_description ${default} --italics
      set -g fish_pager_color_selected_background --background=${default_darker}
      set -g fish_pager_color_selected_prefix ${default}
      set -g fish_pager_color_selected_completion ${default}
      set -g fish_pager_color_selected_description ${default} --italics
    '';
		functions = {
			fish_prompt = ''
                echo ""
        	set_color $fish_color_cwd
                echo -n '['(prompt_pwd)'/]'
                echo ""
                set_color $fish_color_normal
                echo -n ' > '
        	set_color normal
      '';
		};
	};
}
