class GithubCopilot < Formula
  desc "GitHub Copilot CLI"
  homepage "https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli"
  url "https://registry.npmjs.org/@github/copilot/-/copilot-0.0.358.tgz"
  sha256 "5841a00db7a3dfed91b587b51237e024c3320e596c5e22267beb2e8d6fd5ac74"

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
