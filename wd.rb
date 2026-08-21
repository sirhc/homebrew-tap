class Wd < Formula
  desc "Jump to custom directories in zsh"
  homepage "https://github.com/mfaerevaag/wd"
  url "https://github.com/mfaerevaag/wd/archive/refs/tags/v0.10.1.tar.gz"
  sha256 "477ef327ba14d5c311c7360f0203c122e1b6ee95dfd50492743552cd14a3466b"
  license "MIT"
  head "https://github.com/mfaerevaag/wd.git", branch: "master"

  def install
    bin.install "wd.sh" => "wd"
    man1.install "wd.1"
    (share/"zsh/site-functions").install "_wd.sh" => "_wd"
  end

  test do
    assert_predicate bin/"wd", :executable?
    assert_match "wd version 0.10.1", shell_output("#{bin}/wd --version")
  end
end
