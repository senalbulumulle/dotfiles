# rust-standalone

A custom Homebrew formula that installs the **official prebuilt Rust stable
toolchain** on macOS (Apple Silicon and Intel).

| Item      | Value                                  |
| --------- | -------------------------------------- |
| Version   | 1.100.0 (stable)                       |
| Source    | https://static.rust-lang.org/dist/     |
| Installs  | `rustc`, `cargo`, `rustfmt`, `cargo-clippy`, `rust-analyzer`, standard library |

It's called `rust-standalone` so it doesn't clash with Homebrew's built-in
`rust` formula. Uninstall `rust` or `rustup` from Homebrew before using it.

## Install

```shell
# one-time: create a local tap (skip if you already have one)
brew tap-new "$USER/local"

# copy the formula into the tap and install
cp rust-standalone.rb "$(brew --repository "$USER/local")/Formula/"
brew install "$USER/local/rust-standalone"
```

Check it works:

```shell
rustc --version
cargo --version
brew test "$USER/local/rust-standalone"
```

## Update to a newer Rust release

1. Find the latest stable version:

   ```shell
   curl -fsSL https://static.rust-lang.org/dist/channel-rust-stable.toml \
     | awk '/^\[pkg.rust\]/{f=1} f&&/^version/&&!p{print;p=1}'
   ```

2. Get the checksums for both Mac architectures (replace `X.Y.Z`):

   ```shell
   curl -fsSL https://static.rust-lang.org/dist/rust-X.Y.Z-aarch64-apple-darwin.tar.gz.sha256
   curl -fsSL https://static.rust-lang.org/dist/rust-X.Y.Z-x86_64-apple-darwin.tar.gz.sha256
   ```

3. In `rust-standalone.rb`, update `version`, both `url` lines and both
   `sha256` lines.

4. Copy it into the tap again and upgrade:

   ```shell
   cp rust-standalone.rb "$(brew --repository "$USER/local")/Formula/"
   brew upgrade "$USER/local/rust-standalone"
   ```

## Uninstall

```shell
brew uninstall rust-standalone
```
