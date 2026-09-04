{ ... }:
{
	security.pam.services = {
            ly.enableGnomeKeyring = true;

            # needed so the screen lockers can actually validate my password
            # modular setup depending on which lock is in use
            hyprlock = { };
        };
}
