# snowfoundry

**Status: slated for deletion.** Don't start new work here; it is stale (24.11 pins,
Nov 2024 zenix lock) and will be removed.

nix-darwin + home-manager config for one Mac, `javelin` (aarch64-darwin), user
`thalin`. Built with Snowfall lib (namespace `snowfoundry`); everything is
auto-discovered by directory. See the workspace rule
`../.claude/rules/snowfall.md` (from the workspace root:
`.claude/rules/snowfall.md`) for the layout conventions.

## Layout

- `systems/aarch64-darwin/javelin/default.nix` — the whole darwin system: hostname,
  nix settings, zsh, `system.defaults` (Dock, Finder, NSGlobalDomain), the
  `thalin` user.
- `homes/aarch64-darwin/thalin@javelin/` — home-manager config for thalin on
  javelin. `default.nix` imports `stylix.nix` (gruvbox-dark-medium, fonts) and
  `zen.nix` (zenix options), and turns on `foundry.tools`.
- `modules/home/foundry-tools/` — the repo's only local module. It defines
  `foundry.tools.enable` (dev packages plus direnv with zsh integration). Local
  options live under `foundry.*`, not under the Snowfall namespace.
- `shells/` — devShells: `darwin-util` (just, neovim, git, nix, nh) and
  `foundry-f1` (Python 3.12 + pdm, aliases `vim` to `pdm run vim`). Enter with
  `nix develop .#<name>`.

## Inputs and couplings

- Pinned to `nixos-24.11` nixpkgs and `release-24.11` home-manager. Unfree is
  allowed (`channels-config`).
- `homes.modules` in `flake.nix` adds `zenix.homeModules.zenix` and stylix's
  home-manager module to every home. The `zen.*` options set in `zen.nix` come
  from zenix-modules (`../zenix-modules/`, see `.claude/rules/zenix-modules.md`).
- **Gotcha:** the `zenix` input is `path:/Users/thalin/projects/zenix-modules`, a
  path that exists only on the Mac. On the Linux workspace, evaluation needs
  `--override-input zenix path:../zenix-modules` (or a worktree of it). The lock
  pins zenix from Nov 2024, so the current zenix-modules may not match the
  options this repo sets.

## Commands (justfile)

- `just build <host>` — builds `.#darwinConfigurations.<host>.system`.
- `just switch <host>` — builds, then runs `./result/sw/bin/darwin-rebuild switch`.
  Only works on the Mac itself.
- `just update-input <input>` — updates one flake input.

## Adding things

- New home module: `modules/home/<name>/default.nix` with an `options.foundry.<name>`
  enable flag, then enable it in `homes/aarch64-darwin/thalin@javelin/default.nix`.
- New devShell: `shells/<name>/default.nix` returning `mkShell`.
- `git add` new files before evaluating; flakes ignore untracked files.
