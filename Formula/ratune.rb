# Prebuilt macOS binaries from upstream GitHub Releases (per-arch tarballs).
#
# This `homebrew/` tree is its own git repository (tap root). See README.md. Typical install:
#   brew tap acmagn/tap
#   brew install ratune
#
# Upstream app + release artifacts: https://github.com/acmagn/ratune
class Ratune < Formula
  desc "Terminal music player for Subsonic-compatible servers"
  homepage "https://github.com/acmagn/ratune"
  version "0.9.4"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/acmagn/ratune/releases/download/v#{version}/ratune-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "8925d2cc766fcfcf1b1108331faef80ea02c79ef408262b9c9bebdfea9a40cee"
  end

  on_intel do
    url "https://github.com/acmagn/ratune/releases/download/v#{version}/ratune-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "496d9832e2a8c3a80a79bd7e1ab9aace8cc1a04351fc0edf187bd359d294c72d"
  end

  def install
    bin.install "ratune"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ratune --version")
  end
end
