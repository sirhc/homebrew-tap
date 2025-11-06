class GithubCopilot < Formula
  desc "GitHub Copilot CLI"
  homepage "https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli"
  url "https://registry.npmjs.org/@github/copilot/-/copilot-0.0.354-0.tgz"
  sha256 "262aca32105eb7ed29c5f67fd7ceedff3bbacc9ad88ffb099852253fd01e3cf0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # add a meaningful test here, version isn't usually meaningful
    assert_match version.to_s, shell_output("#{bin}/copilot --version")
  end
end
