class Wd < Formula
  desc "Jump to custom directories in zsh"
  homepage "https://github.com/mfaerevaag/wd"
  url "https://github.com/mfaerevaag/wd/archive/refs/tags/v0.9.2.tar.gz"
  sha256 "543cae386eea087dabd556abe7dca8edafbc463d5ac5d4d84bbe9c9b30465f8e"
  license "MIT"
  revision 1
  head "https://github.com/mfaerevaag/wd.git", branch: "master"

  def install
    bin.install "wd.sh" => "wd"
    man1.install "wd.1"
    (share/"zsh/site-functions").install "_wd.sh" => "_wd"
  end

  test do
    assert_predicate bin/"wd", :executable?
    assert_match "wd version 0.9.2", shell_output("#{bin}/wd --version")
  end
end
