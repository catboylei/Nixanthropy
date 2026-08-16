{ ... }: {
    imports = [
        ./nix/system-settings.nix
        ./nix/gtk.nix
        ./nix/bluetooth.nix
        ./nix/programs.nix
        ./nix/greetd-autologin.nix
        ./nix/system-packages.nix
    ];
}