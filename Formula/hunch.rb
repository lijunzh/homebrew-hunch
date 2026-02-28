class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "6a9c874ccae6cab871dcf79e487de0d6a2e7a3927c85e61b64bd3d548ac27ff2"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "e33ca5316373776c3f814273576e6f6fff1cd3ce81bed72ca034a5e5ec2af595"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26d75b5c96c4ebb77e8590b9473552a0b4bfc7086960e567e70087f376f6f735"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v#{version}/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0cf74d4b5fa5207900e2f77971c9e2c02ca93a51140e7d5fcfa7d20754fac32e"
    end
  end

  def install
    # Binary is inside a subdirectory named hunch-<target>
    # Find the hunch binary wherever it lives in the extracted archive
    bin.install Dir["**/hunch"].first
  end

  test do
    output = shell_output("#{bin}/hunch 'The.Matrix.1999.1080p.BluRay.x264-GROUP.mkv'")
    assert_match '"title": "The Matrix"', output
    assert_match '"year": 1999', output
  end
end
