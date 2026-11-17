class GoIpcalc < Formula
  desc "Go port of ipcalc: IPv4/IPv6 network calculator"
  homepage "https://github.com/cleonte/go-ipcalc"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.4/ipcalc_0.1.4_darwin_arm64.tar.gz"
      sha256 "50a6f5a3d15e97dbf200eec364603305bbb59fe9141889a85d3fe01e8c085421"
    end
    on_intel do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.4/ipcalc_0.1.4_darwin_amd64.tar.gz"
      sha256 "2560d122a6027aa26873c08143eeac19c000bbc0f76f7b532f2086a7db7612d7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.4/ipcalc_0.1.4_linux_arm64.tar.gz"
      sha256 "1145974944e03a74bc7a47ee8bfab1c92c0199b22bad1ce0c7b536149e9ddd72"
    end
    on_intel do
      url "https://github.com/cleonte/go-ipcalc/releases/download/v0.1.4/ipcalc_0.1.4_linux_amd64.tar.gz"
      sha256 "61d02e4f69345f02673ba785554e97755c73ce9044d9e2fde6451bb692e75012"
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
