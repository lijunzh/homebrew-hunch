class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "2.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.4/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "e1770e00016309d86d9cca8370dac3a175083ba5cc08c9333b6a1809bd610484"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.4/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "fa6d8ebfe5bb7a0f6a4115e233baa6050f08b1ea04fb344ee7f2f25e47301268"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.4/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b64383cb202cd3dd4fde0a16704ac35beb8986701cc16bd04cf48231ece0b85"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.4/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3064826e314390a7f60ab3444609fca5c331c40f213c11279fdf74a7eafc1ff6"
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
