class Ops < Formula
  desc "Where ops scripts cultivate and grow!"
  homepage "https://github.com/Tealium/opsbox"
  url "https://github.com/Tealium/opsbox/archive/refs/tags/REL.20241014.1.tar.gz", headers: ["Authorization: Bearer #{ENV['HOMEBREW_GITHUB_API_TOKEN']}"]
  sha256 "efe88cf3930783db97f611b32c836b02152586c9ff573008df3c76c89805af51"
  revision 1
  head "https://github.com/Tealium/opsbox.git", branch: "main"

  depends_on "go" => :build
  # depends_on "aws-vault"

  # These are from the README. Not sure how many of them are actually required.
  # depends_on "ack"
  # depends_on "awscli"
  # depends_on "chef-workstation"
  # depends_on "font-anonymice-nerd-font"
  # depends_on "font-inconsolata-go-nerd-font"
  # depends_on "font-inconsolata-lgc-nerd-font"
  # depends_on "font-inconsolata-nerd-font"
  # depends_on "font-sauce-code-pro-nerd-font"
  # depends_on "fzf"
  # depends_on "git"
  # depends_on "gnu-sed"
  # depends_on "gnu-tar"
  # depends_on "grep"
  # depends_on "helm"
  # depends_on "ipython"
  # depends_on "jq"
  # depends_on "k9s"
  # depends_on "parallel"
  # depends_on "pssh"
  # depends_on "pyenv"
  # depends_on "rbenv"
  # depends_on "shfmt"
  # depends_on "tfenv"
  # depends_on "yq"
  # depends_on "zsh"

  def install
    system "go", "build", *std_go_args(ldflags: "-X 'github.com/tealium/opsbox/ops/cmds.buildTag=REL.20241014.1'"), "./ops"
  end

  test do
    assert_predicate bin/"ops", :executable?
  end
end
