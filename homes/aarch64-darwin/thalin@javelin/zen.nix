# See: https://github.com/thalin/zenix-modules/tree/main/modules/home
{ ... }:
{
  zen = {
    # https://github.com/thalin/zenix-modules/blob/main/modules/home/roles/cli.nix
    roles.cli.enable = true;
  };
}
