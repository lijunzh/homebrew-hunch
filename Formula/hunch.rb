class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "1.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.8/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "04c558171b40db58cdd3d97d96cc346815df954d3123dbc320afef7156e9169d"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.8/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "7a1d98df9f7f9246410346552103586ba653f1863dee675919b99913a6b03e3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.8/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f99f2900a65a04046d6507844d203f8068103a960b740dcf16ae14a0eefaf2c"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.8/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a73e8428eb50efdf6ab16e0aa43bcf0710c052c8802749fca341068478119bbf"
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
