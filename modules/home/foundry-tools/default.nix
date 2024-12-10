{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.foundry.tools;
in
{
  options.foundry.tools.enable = mkEnableOption "foundry: enable dev tools";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      graphite-cli
      pdm
      devenv
    ];

    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
