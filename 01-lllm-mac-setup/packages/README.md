# Custom Homebrew packages

Custom Homebrew formulae, one folder per package.

```
packages/
├── README.md                      <- this file
├── copy-packages.sh               <- copies all packages into your local tap
├── template/
│   └── package-template.rb        <- starting point for new packages
└── rust/
    ├── README.md                  <- install / update steps for Rust
    └── rust-standalone.rb         <- official prebuilt Rust toolchain
```

| Package           | Folder      | What it installs                                  |
| ----------------- | ----------- | ------------------------------------------------- |
| `rust-standalone` | `rust/`     | Rust stable: rustc, cargo, rustfmt, clippy        |

## Quick start: copy all packages

`copy-packages.sh` copies every formula (except `template/`) into the
local tap `$USER/local`, creating the tap first if it doesn't exist.

```shell
./copy-packages.sh                 # tap: $USER/local
./copy-packages.sh myname/tools    # or pick another tap
brew install "$USER/local/rust-standalone"
```

Run it again any time you add or change a package.

## Create a new package

```shell
mkdir my-tool
cp template/package-template.rb my-tool/my-tool.rb
```

Then edit `my-tool/my-tool.rb`:

- Rename the class to match the file name in CamelCase (`my-tool.rb` -> `class MyTool < Formula`).
- Fill in `desc`, `homepage`, `url`, `license` and the `install` / `test` blocks.
- Set `sha256` to the checksum of the release tarball:

```shell
curl -L https://github.com/OWNER/REPO/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256
```

## Install a package through a local tap

Homebrew installs formulae from taps, so create a local one once:

```shell
brew tap-new "$USER/local"
```

Copy the formula into the tap and install it:

```shell
cp my-tool/my-tool.rb "$(brew --repository "$USER/local")/Formula/"
brew install "$USER/local/my-tool"
```

## Check it

```shell
brew audit --strict "$USER/local/my-tool"
brew test "$USER/local/my-tool"
```

## Remove it

```shell
brew uninstall my-tool
brew untap "$USER/local"   # only if you want to remove the whole tap
```
