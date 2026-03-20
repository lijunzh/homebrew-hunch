class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "1.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.4/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "825c336c40388881ea3cdd19863f3305c28b313dddfa6b062f3f4f9570d5f324"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.4/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "142073e755eee9767116a2940e52520cfd8dfebbcef3ef4b303010d6d6efa85e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.4/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e205f4ce7c288134ebc02bd6ddb19105290163ea48490d7ceae6d684987d21d0"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v1.1.4/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "422a5cdef4b002e2b5c4d0c9e464cb026c712e3328dc33ac1ddb6ac2f9d78f6f"
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
