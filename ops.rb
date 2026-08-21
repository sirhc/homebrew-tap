class Ops < Formula
  desc "Where ops scripts cultivate and grow!"
  homepage "https://github.com/Tealium/opsbox"
  url "https://github.com/Tealium/opsbox/archive/refs/tags/REL.20241206.1.tar.gz", headers: ["Authorization: Bearer #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}"]
  sha256 "9ac4b98f5ad5353d40e337f5ce890aa944a5e7043b84cb19e08b44fafc85e4e5"
  revision 1
  head "https://github.com/Tealium/opsbox.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-X 'github.com/tealium/opsbox/ops/cmds.buildTag=REL.20241206.1'"
    system "go", "build", *std_go_args(ldflags: ldflags), "./ops"
  end

  test do
    assert_predicate bin/"ops", :executable?
  end
end
