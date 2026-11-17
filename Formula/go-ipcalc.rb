class GoIpcalc < Formula
  desc "Go port of ipcalc: IPv4/IPv6 network calculator"
  homepage "https://github.com/cleonte/go-ipcalc"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.3/ipcalc_0.1.3_darwin_arm64.tar.gz"
      sha256 "6f17e13345e34b9d1cac46849afbf88ef6b0b571d99e71a6874b3487818e6bf3"
    end
    on_intel do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.3/ipcalc_0.1.3_darwin_amd64.tar.gz"
      sha256 "62478a5aedc1de2bd49c2be44012c2f87922c86541c3a72e90991f3051974de7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.3/ipcalc_0.1.3_linux_arm64.tar.gz"
      sha256 "a068f2177238eaa3540e4cd1c9a5e1bf413222dddcea5482dfa81b115220697d"
    end
    on_intel do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.3/ipcalc_0.1.3_linux_amd64.tar.gz"
      sha256 "39ee87f0ee9cf20b044d7514307fcba2c064c486f44fe66283f2c4ae5906f03d"
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
