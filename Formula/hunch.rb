class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "b6e1f8049f3caa14f2f2787ab0157d77d6f5b481b4092d69714b25cc69691dd8"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "9c755f03a10b0994d541b18eebbaaa22d9c7c6bc2a1160d9965a862562d814e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5442b774d7044c5a4fe4aeaa0b74b7f8d71a5eef06a04ff08ed364c3192531e9"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "985259c410db28eec69d66c49f25900834fe0c975b75487a77fa318e10b982a4"
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
