class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "2.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.3/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "ae44c88405c2b7e4ad6bd9e11c5123f44e08da9555934cebdcf3c8eecb0ed3da"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.3/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "2d5bbfe1cae0e4c8c9c930489bf329edfd78ffcaa4afa4a2142fd9cb02d5f3eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.3/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad0d1f0308668526575b5fe66bdabf13a5b30d0118139537f1e04c8cfb81c6a8"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.3/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2296e32cc1d19384ce9826551c6d6d2725fd57eb911f5d633ba56ec6400d5598"
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
