class GoIpcalc < Formula
  desc "Go port of ipcalc: IPv4/IPv6 network calculator"
  homepage "https://github.com/cleonte/go-ipcalc"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.5/ipcalc_0.1.5_darwin_arm64.tar.gz"
      sha256 "4931fd51dba1c2380f6aa74952fad065714b76ae933cd5e15b03c1271422a65b"
    end
    on_intel do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.5/ipcalc_0.1.5_darwin_amd64.tar.gz"
      sha256 "0d3a9bc81104316fbb8c519a8e1416a0dde1d9d777b2c107a3f306e402ac33c6"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.5/ipcalc_0.1.5_linux_arm64.tar.gz"
      sha256 "beeaa98a2778c01365141efea9e39972763d2a854ccefed5f33666caa01f4cc7"
    end
    on_intel do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.5/ipcalc_0.1.5_linux_amd64.tar.gz"
      sha256 "726f8344ef4aa5e5a0330fa8b4cb8a66369c87e047c8d345bce4bf3730de118e"
    end
  end

  conflicts_with "ipcalc", because: "both install an `ipcalc` binary"

  def install
    bin.install "ipcalc"
    man1.install "ipcalc.1"
  end

  test do
    assert_match "Network:\t192.168.1.0/24", shell_output("#{bin}/ipcalc 192.168.1.10/24")
    assert_match version.to_s, shell_output("#{bin}/ipcalc -v")
  end
end
