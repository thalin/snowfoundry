{ pkgs, ... }: 

{
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages =
    [ pkgs.neovim ];

    networking.computerName = "javelin";
    networking.hostName = "javelin";

    # Auto upgrade nix package and the daemon service.
    services.nix-daemon.enable = true;
    # services.karabiner-elements.enable = true;
    # nix.package = pkgs.nix;

    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

    # Create /etc/zshrc that loads the nix-darwin environment.
    programs.zsh.enable = true;  # default shell on catalina
    # programs.fish.enable = true;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 4;
    system.defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSTableViewDefaultSizeMode = 2;
        "com.apple.swipescrolldirection" = false;
      };
      controlcenter = {
        BatteryShowPercentage = true;
      };
      dock.autohide = true;
      finder = {
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      loginwindow.GuestEnabled = false;
    };

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";

    users.users.thalin = {
        name = "thalin";
        home = "/Users/thalin";
    };
}
