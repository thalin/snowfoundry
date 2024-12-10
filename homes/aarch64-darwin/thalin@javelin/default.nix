{ ... }:
{
  imports = [
    ./stylix.nix
    ./zen.nix
  ];

  foundry.tools.enable = true;

  home.stateVersion = "24.05";
}
