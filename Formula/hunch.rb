class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "1.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.7/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "07d1761d9b951682f85a463001a332c4f3d87e8e506150ffdf94cb3632787219"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.7/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "b529ec8773cfd7446d11c43e57dfe5bc2daf2b9ec5160ff7f574bddd5b30690a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.7/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "356b16277e35ea4cf377ad5a67188dca5f635c87c7bfdfdbedc2f8655998590a"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.7/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c023b23a9f5b60a7eb49436835b2f3417c0e7a1012bf1ae7eeb2b250c1915353"
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
