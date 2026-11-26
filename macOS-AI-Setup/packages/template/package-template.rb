# Homebrew formula template
#
# How to use:
#   1. Copy this file and rename it to your package name, e.g. `my-tool.rb`.
#   2. Rename the class to match the file name in CamelCase:
#        my-tool.rb   -> class MyTool < Formula
#        foo_bar.rb   -> class FooBar < Formula
#   3. Replace every REPLACE_ME value below.
#   4. Get the sha256 of the release tarball with:
#        curl -L <url> | shasum -a 256
#   5. Delete the build section(s) you don't need in `def install`.
#
# Put each package in its own folder, e.g. packages/my-tool/my-tool.rb.
# See packages/README.md for installing it through a local tap.
# Docs: https://docs.brew.sh/Formula-Cookbook

class PackageTemplate < Formula
  desc "REPLACE_ME: one-line description of the package"
  homepage "https://github.com/REPLACE_ME/REPLACE_ME"
  url "https://github.com/REPLACE_ME/REPLACE_ME/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  # Optional: lets you install the latest commit with `brew install --HEAD`.
  head "https://github.com/REPLACE_ME/REPLACE_ME.git", branch: "main"

  # Dependencies (uncomment what you need)
  # depends_on "cmake" => :build
  # depends_on "go" => :build
  # depends_on "rust" => :build
  # depends_on "python@3.12"
  # depends_on :macos

  def install
    # --- Option A: prebuilt script or binary -------------------------------
    # Installs a file from the tarball into Homebrew's bin directory.
    bin.install "REPLACE_ME"

    # --- Option B: Makefile ------------------------------------------------
    # system "make", "install", "PREFIX=#{prefix}"

    # --- Option C: CMake ---------------------------------------------------
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    # system "cmake", "--build", "build"
    # system "cmake", "--install", "build"

    # --- Option D: Go ------------------------------------------------------
    # system "go", "build", *std_go_args(ldflags: "-s -w")

    # --- Option E: Rust ----------------------------------------------------
    # system "cargo", "install", *std_cargo_args
  end

  test do
    # Runs with `brew test <name>`. Must exit successfully.
    system bin/"REPLACE_ME", "--version"
  end
end
