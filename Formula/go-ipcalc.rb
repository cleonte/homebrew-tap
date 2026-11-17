class GoIpcalc < Formula
  desc "Go port of ipcalc: IPv4/IPv6 network calculator"
  homepage "https://github.com/cleonte/go-ipcalc"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.1/ipcalc_0.1.1_darwin_arm64.tar.gz"
      sha256 "782a8de3eab3dd44325c1c6f7f77ebcd7acc24c12a11ef9ee8e927ca2e99eb81"
    end
    on_intel do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.1/ipcalc_0.1.1_darwin_amd64.tar.gz"
      sha256 "c2270fa98fd630503c914e46d4f285e8dcb208214469973822dcb0a1111650a4"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.1/ipcalc_0.1.1_linux_arm64.tar.gz"
      sha256 "c39c7a3fb7ee833f439bcbb7ed21a6c6f5ab1e1f27e26ec672eb11de5e9c86c0"
    end
    on_intel do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.1/ipcalc_0.1.1_linux_amd64.tar.gz"
      sha256 "935131581c3154b2f8ea32f2730e77981e47baa097a00a8fdbd2289cd0874884"
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
