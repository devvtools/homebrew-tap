class Devv < Formula
  desc "Developer utilities in your terminal — interactive REPL + pipelines"
  homepage "https://devv.tools"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devvtools/devv-cli/releases/download/v0.2.2/devv-darwin-arm64"
      sha256 "bfe5b5d202c94cef2f77831ce92cfa6ee6d64fc2ce7f066f955438d7052e7f8d"
    else
      url "https://github.com/devvtools/devv-cli/releases/download/v0.2.2/devv-darwin-x64"
      sha256 "e3a4a0ebd830e7df60d29dfb32f17bcb2cfe24b672103ba1784ce2d66eaa4ca8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devvtools/devv-cli/releases/download/v0.2.2/devv-linux-arm64"
      sha256 "ee1d887bb498384a0f4d947e2c70026e472285c17ab03b6a0b7f7d7f824f9628"
    else
      url "https://github.com/devvtools/devv-cli/releases/download/v0.2.2/devv-linux-x64"
      sha256 "460797eaf17c795269a04ce9f766b4dfdab838c5693f46eb956a1c9be6b22bcb"
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
