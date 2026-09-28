# rokuroo-nixos

NixOS configuration for my two machines, built from one flake. nixpkgs and
home-manager both track the 26.05 release branches.

## Hosts

- `reverie`: NVIDIA desktop. Boots GRUB with the minegrub world-selection theme and
  runs a Plasma 6 session.
- `opal`: AMD machine. Boots systemd-boot and runs a niri session with noctalia.

Shared configuration lives in `modules/system` and `modules/home`. Anything that
differs between the machines sits in `hosts/<name>/default.nix`.

## Setting up a machine

`hardware-configuration.nix` is not committed on purpose. It describes one machine's
disks, so you generate it after cloning, at the repo root:

```bash
sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
```

On a machine that is already installed you can copy the existing file instead:

```bash
cp /etc/nixos/hardware-configuration.nix .
```

Both hosts import this file, so nothing builds without it.

## Building

From the repo root, use the host matching the machine you are on:

```bash
sudo nixos-rebuild switch --flake .#reverie
sudo nixos-rebuild switch --flake .#opal
```

The config turns on the `nix-command` and `flakes` features itself, so the plain
commands work after the first successful switch. On a fresh installer that has not
enabled them yet, set them for that one run:

```bash
sudo NIX_CONFIG="experimental-features = nix-command flakes" nixos-rebuild switch --flake .#reverie
```

`flake.nix` also adds the noctalia binary cache. sudo builds pick it up on their own;
if you build as your normal user, nix asks first and `--accept-flake-config` answers
yes.

## Updating

```bash
nix flake update
sudo nixos-rebuild switch --flake .#<host>
```

## License

MIT, see LICENSE.
