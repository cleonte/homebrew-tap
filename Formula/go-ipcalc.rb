class GoIpcalc < Formula
  desc "Go port of ipcalc: IPv4/IPv6 network calculator"
  homepage "https://gitlab.com/ipcalc/go-ipcalc"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://gitlab.com/api/v4/projects/ipcalc%2Fgo-ipcalc/packages/generic/ipcalc/1.2.0/ipcalc_1.2.0_darwin_arm64.tar.gz"
      sha256 "6ef5c8c17a06f29fb82d5bd75e9b266e357ce421fd389f1d30f3897b8842aaf4"
    end
    on_intel do
      url "https://gitlab.com/api/v4/projects/ipcalc%2Fgo-ipcalc/packages/generic/ipcalc/1.2.0/ipcalc_1.2.0_darwin_amd64.tar.gz"
      sha256 "a347b413fd4d93896046c762e4c91e4a0290f70d2e7c7c4cfeb808568078d785"
    end
  end
  on_linux do
    on_arm do
      url "https://gitlab.com/api/v4/projects/ipcalc%2Fgo-ipcalc/packages/generic/ipcalc/1.2.0/ipcalc_1.2.0_linux_arm64.tar.gz"
      sha256 "2f02483d2ecacbaa15bd2a1b4a45f4bc20995d2824e55c4238c47e7746a2b152"
    end
    on_intel do
      url "https://gitlab.com/api/v4/projects/ipcalc%2Fgo-ipcalc/packages/generic/ipcalc/1.2.0/ipcalc_1.2.0_linux_amd64.tar.gz"
      sha256 "f0eb668a4771ed52a1addefa2a7fcff924df0eb717853e22a4d5df26e6c10369"
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
