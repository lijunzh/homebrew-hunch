class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v2.1.0/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "d53a322235d7711b7585f545bbdb2da25ade736123f9fed7a6ef5af50842e6f0"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v2.1.0/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "8e0f870e16aacfcd8fd3c803405c27105936e88047da7935c43bd11ba7b9a35f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v2.1.0/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "301d32f4a7d73906988d49398fc56052f20d59329edf28399a51bcf525e1f206"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v2.1.0/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20b68a16cfb3129273eba84b2520e1c959e09dbba0fb4a8873d564d797ca974d"
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
