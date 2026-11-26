# Installs the official prebuilt Rust toolchain (stable) on macOS.
#
# It downloads the standalone installer from static.rust-lang.org and
# installs rustc, cargo, rustfmt, clippy, rust-analyzer and the standard
# library into Homebrew's prefix. No rustup, no ~/.cargo.
#
# Named `rust-standalone` so it doesn't clash with Homebrew's own `rust`
# formula. See README.md in this folder for install and update steps.

class RustStandalone < Formula
  desc "Official prebuilt Rust toolchain (rustc, cargo, rustfmt, clippy)"
  homepage "https://www.rust-lang.org/"
  version "1.100.0"
  license any_of: ["Apache-2.0", "MIT"]

  on_arm do
    url "https://static.rust-lang.org/dist/rust-1.100.0-aarch64-apple-darwin.tar.gz"
    sha256 "bff12b7c3f257e2b0ed6f3f22b6345ef8462762680b26b5ae0cd8e1ed4c1c135"
  end

  on_intel do
    url "https://static.rust-lang.org/dist/rust-1.100.0-x86_64-apple-darwin.tar.gz"
    sha256 "9ff5711ddd7df2e535094406c12e4244cb2aa90c65ddc260467d1d3c51b36e80"
  end

  depends_on :macos

  conflicts_with "rust", because: "both install `rustc` and `cargo`"
  conflicts_with "rustup", because: "both install `rustc` and `cargo`"

  def install
    system "./install.sh", "--prefix=#{prefix}", "--disable-ldconfig"
  end

  test do
    # rustc: compile and run a small program
    (testpath/"hello.rs").write <<~RUST
      fn main() {
          println!("Hello from Rust!");
      }
    RUST
    system bin/"rustc", "hello.rs"
    assert_equal "Hello from Rust!\n", shell_output("./hello")

    # cargo: create and run a new project
    system bin/"cargo", "new", "hello_cargo", "--bin", "--vcs", "none"
    cd "hello_cargo" do
      assert_match "Hello, world!", shell_output("#{bin}/cargo run")
    end

    # bundled tools
    system bin/"rustfmt", "--version"
    system bin/"cargo-clippy", "--version"
  end
end
