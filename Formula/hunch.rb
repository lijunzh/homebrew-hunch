class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "a4efa8086818fc6d848c29f822204bd841d1ccb9d4c05e1acf4a4edc87889a7f"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "2d1bf133030f370def05cd75c50351ddbc2ecbb5c2ee86586cba1d91e8ee337e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df6509fd50aa2b2fa84a5f265f17b82f45308da14b1dfecfd7e8b375b9e6543c"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ba2ce068e1aeb6dc6630d98b5fe31a3b30397076eb8ce2ee345fc25b6328dbe"
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
