class Devv < Formula
  desc "Developer utilities in your terminal — interactive REPL + pipelines"
  homepage "https://devv.tools"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devvtools/devv-cli/releases/download/v0.1.0/devv-darwin-arm64"
      sha256 "161eed1f11752d0c0576b7961104bd1148d0ef23177d6517c5dbda4dd95e14ec"
    else
      url "https://github.com/devvtools/devv-cli/releases/download/v0.1.0/devv-darwin-x64"
      sha256 "9934aaa34a1840bf08bd07174fbc62d93917d50163b6d03b044a1e47a2e9ebb6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devvtools/devv-cli/releases/download/v0.1.0/devv-linux-arm64"
      sha256 "b969a1c6d1f2b978c6cc4c7e53949313d97887da928861e62f7db326ce22be7d"
    else
      url "https://github.com/devvtools/devv-cli/releases/download/v0.1.0/devv-linux-x64"
      sha256 "a736626693b8461bdcd829da2df08e5e99d015a565b9d55f7ce8635e9f20b3c0"
    end
  end

  def install
    binary = Dir["devv-*"].first || "devv"
    bin.install binary => "devv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devv --version")
  end
end
