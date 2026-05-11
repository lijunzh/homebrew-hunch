class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "2.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.2/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "4e221ea7b4ed5b02774a54c020f1387478f5f2203b602c12d99e91b2746bf768"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.2/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "a9cf4e5e3f79db211f0775e6090701b2497b8d8d6539f2811b5194c03e149303"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.2/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "920dc5bd11d3f8d165c60188e1755b4e6694b4d6206176bad50281fa59c62166"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.2/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da9e20e0ef562823cce7a34ec07ec57a15ee6d0acc5ef101d3b8790ff7c5ee93"
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
