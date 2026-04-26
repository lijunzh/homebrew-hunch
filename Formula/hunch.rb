class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.1/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "907345ece9ee6fe1d3003eaf5e9150e45f64a0f5c26aac36bb36640ff3a0ea28"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.1/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "fcba3284ef7735c00b942bb300aaedaa98df0851e83b86860a4155d48f4a0e5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.1/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aca5db806a284cac201a9ca5ecf1fba57ef239759e18e15ddf46076806d1db6a"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.1/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "220dea96244a206dd81ccdf4b9f9e401a2be3c712f6d98bd6aa97ea1af4259f6"
    end
  end

  def install
    bin.install Dir["**/hunch"].first
  end

  test do
    output = shell_output("#{bin}/hunch 'The.Matrix.1999.1080p.BluRay.x264-GROUP.mkv'")
    assert_match '"title": "The Matrix"', output
    assert_match '"year": 1999', output
  end
end
