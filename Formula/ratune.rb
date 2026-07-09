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
  version "0.15.1"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/acmagn/ratune/releases/download/v#{version}/ratune-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "9f0ca13cb5f5e895adf6a6c3fc57f2a060ca3961526bb21c558bb25d179c321b"
  end

  on_intel do
    url "https://github.com/acmagn/ratune/releases/download/v#{version}/ratune-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "5889db19beff9f2f3a2bc3102340781c62481c366b81c1f328b0adc8539575ed"
  end

  def install
    bin.install "ratune"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ratune --version")
  end
end
