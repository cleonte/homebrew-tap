class GoIpcalc < Formula
  desc "Go port of ipcalc: IPv4/IPv6 network calculator"
  homepage "https://github.com/cleonte/go-ipcalc"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.2/ipcalc_0.1.2_darwin_arm64.tar.gz"
      sha256 "c5cb452d6c5ffa680b24ed85afd2832e020c7579ada0bb828ff192115a6fad82"
    end
    on_intel do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.2/ipcalc_0.1.2_darwin_amd64.tar.gz"
      sha256 "da5053f3d42e303fd8c02e5124abca64f3747347d43219121f3ae335e025fbfc"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.2/ipcalc_0.1.2_linux_arm64.tar.gz"
      sha256 "e9faefd2a9e16577e51d4c2ede5fdad24fc58f405b68eadc9410c178527a118a"
    end
    on_intel do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.2/ipcalc_0.1.2_linux_amd64.tar.gz"
      sha256 "7123b32cc39ec91e445c7332b3201157a019ee4174dd1d327dc000171410c3cd"
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
