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
  version "0.16.0"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/acmagn/ratune/releases/download/v#{version}/ratune-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "950f3c5b50c7bf12bc36d3cdbb06efb088abe7e006e9944b06cd382c1d883491"
  end

  on_intel do
    url "https://github.com/acmagn/ratune/releases/download/v#{version}/ratune-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "3cbc556df5b58b14cc16d24e4d134df027f301dcf94d73a0b11eb0c8261290b6"
  end

  def install
    bin.install "ratune"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ratune --version")
  end
end
