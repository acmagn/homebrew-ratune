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
  version "0.9.3"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/acmagn/ratune/releases/download/v#{version}/ratune-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "3af96762ab03557ccf01caa1d24992fca2473bf8dc06f983f0fc1f2c30b4ec3e"
  end

  on_intel do
    url "https://github.com/acmagn/ratune/releases/download/v#{version}/ratune-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "2ce26f20389f09e040b9afc82dcc047ccb53ffa59fe8147a7161085834959d68"
  end

  def install
    bin.install "ratune"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ratune --version")
  end
end
