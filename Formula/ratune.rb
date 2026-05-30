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
  version "0.9.9"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/acmagn/ratune/releases/download/v#{version}/ratune-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "c076bdaee021f12530eafa8e76fedb70554c1824c135887a0aa9d4d98716b8b2"
  end

  on_intel do
    url "https://github.com/acmagn/ratune/releases/download/v#{version}/ratune-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "080a222390643a22dea469241a4ee26797f73159404d52832fee252f3e01a25f"
  end

  def install
    bin.install "ratune"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ratune --version")
  end
end
