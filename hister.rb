class Hister < Formula
  desc "Private, full-content search engine for pages you visit and files you keep"
  homepage "https://hister.org/"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/asciimoo/hister/releases/download/v0.17.0/hister_0.17.0_darwin_arm64"
      sha256 "71a60539efbdd5b0c8ee5833b797394179cb604b3ef35ad0413e6f364d20d776"
    end
    on_intel do
      url "https://github.com/asciimoo/hister/releases/download/v0.17.0/hister_0.17.0_darwin_amd64"
      sha256 "d09a228b99c91c46527d786bf253d555914e868818e4fce8a3b831298aecc5f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/asciimoo/hister/releases/download/v0.17.0/hister_0.17.0_linux_arm64"
      sha256 "169e174c093761f5a3ebbc437f9b14677e58546990f0625270198ce672671442"
    end
    on_intel do
      url "https://github.com/asciimoo/hister/releases/download/v0.17.0/hister_0.17.0_linux_amd64"
      sha256 "63161c18627303a90d588b3243e8de5d12976ddd4765d328a79ab61017ed2204"
    end
  end

  # Hister ships as a single self-contained binary; building from source
  # requires Go 1.26 plus a full npm/Svelte frontend build (see manage.sh),
  # so this formula installs the upstream prebuilt release binary instead.
  def install
    bin.install Dir["hister_*"].first => "hister"
    (var/"hister").mkpath
  end

  service do
    run [opt_bin/"hister", "listen"]
    keep_alive true
    working_dir var/"hister"
    log_path var/"log/hister.log"
    error_log_path var/"log/hister.log"
    environment_variables HISTER_DATA_DIR: var/"hister"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hister --version")
  end
end
