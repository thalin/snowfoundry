# vim: ft=just ai sw=2 ts=2 expandtab

update-input input:
  nix flake lock --update-input {{ input }}

build hostname:
  nix build .#darwinConfigurations.{{ hostname }}.system \
    --extra-experimental-features 'nix-command flakes'

switch hostname:
  just build {{ hostname }}
  ./result/sw/bin/darwin-rebuild switch --flake .#{{ hostname }}
