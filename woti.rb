class Woti < Formula
  desc "World time in your terminal — see current times across time zones at a glance"
  homepage "https://github.com/aleris/woti"
  url "https://github.com/aleris/woti/archive/refs/tags/v0.37.0.tar.gz"
  sha256 "289fbee051145af5d33d925696a0d31deb7eeaa3bb115666cf497ff14901790a"
  license "MIT"
  head "https://github.com/aleris/woti.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/woti --version")
  end
end
