class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "1.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.3/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "f0883e3f0f6477c926150c78588bcbe59f7081b702b5a4527b36afb2111ef155"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.3/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "1e228f578a988367fe88a8d3c0446788f15ef799284aa038d2acd45fbac090da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.3/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c28fb86960414827aed87f4b0dc00a4efdf256cba8e03eabf994270d8ee40344"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.3/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0ab910046b073d3a0d4dd7291171f5ba53109e997fef8151401fd2d5487e5e1"
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
