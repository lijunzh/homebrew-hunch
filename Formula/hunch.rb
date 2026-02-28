class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "1.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "299f242fe844c2adeb4b566106a4046d24aa38538203c2d618c06f5bf61882c0"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "680a56ba4539b9d345e21d8f3cfa21061118a32dccd829da23f2110943b69282"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "42dd840597b484bd345e32505afbde5af5a431e5a895921b18a021365b515d67"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6039e4a48913e70c39853e8522e24eea801b02dd6e83ce7572619ba1ee02d12"
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
