class Hunch < Formula
  desc "Fast, offline media filename parser — extract metadata from messy filenames"
  homepage "https://github.com/lijunzh/hunch"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.0/hunch-aarch64-apple-darwin.tar.gz"
      sha256 "31b5f1e8f131ba40ed6936e7cb232830a0415ff50c4b21b48ea4dc0e2f2d7fef"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.0/hunch-x86_64-apple-darwin.tar.gz"
      sha256 "830b31bd5585d63f84489e10a410ed2b7b5e7ee9d357a519bb4a43ba1a8dff1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.0/hunch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "362840ce4b36dee18b397b367698d076f2e2eb2861e1cc39e223d6ab2a5cd5db"
    else
      url "https://github.com/lijunzh/hunch/releases/download/v2.0.0/hunch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0b117031ccf584ea6f86f26ea22d80a86cb40ca83703421f7909495c44279b9"
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
