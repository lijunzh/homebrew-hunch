class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "1.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.6/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "95d3e0d43e4447e4208aaca9b8214a347eaf6874755d28a9ea795b037eb35a4d"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.6/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "d52923e0f04a1c9dc785565f81c1107b0cb557f1283a15a08fd139159e717660"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.6/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b1299a26a6d3bbc734a7a4a94118046b2483b9986d2734179a0a5bf6bf77ed4c"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.6/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c420d2c41380e29f7bd9afe82f4908a239c9d53b05d91e98ce7160dfef99edc"
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
