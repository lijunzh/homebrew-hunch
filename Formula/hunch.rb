class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "1.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.5/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "93f0284f2d4d2e81900cc4ec3413220bd8d5713cbb42c37f3bceb7de6ea1808e"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.5/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "009cfdcbed5720154945c020b5532502b711f878cd9a9ecc9af4f03b37d6c903"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.5/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a3d25e8de933e82011640d667d6f436084cb4a3a7ce1e3637ed3cac8fa2eaee"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.5/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b4c2a83c6e54d01ce18132f9e7e6f6f91a022129475c3bb82e99a7c448f10bb"
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
