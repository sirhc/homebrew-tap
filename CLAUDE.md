# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Homebrew tap (`sirhc/homebrew-tap`). It contains Homebrew formula files (Ruby `.rb` files) that define how to install various tools via `brew install sirhc/<formula>`.

## Usage

```bash
# Add the tap
brew tap sirhc/homebrew-tap

# Install a formula
brew install sirhc/<formula-name>

# Test a formula
brew test sirhc/<formula-name>

# Audit a formula
brew audit --new <formula-name>.rb
```

## Useful Commands

```bash
# Get the SHA256 of a formula's source URL (used when updating versions)
just sha256 <formula>.rb
```

## Formula Patterns

Formulas live as `.rb` files in the repo root. Each is a Ruby class inheriting from `Formula`. Common types in this tap:

- **npm-based**: Use `system "npm", "install", *std_npm_args` with `bin.install_symlink`; depend on `node`. (No formula of this type currently in the tap; `github-copilot.rb` was the prior example, since removed.)
- **Go-based** (`ops.rb`): Use `system "go", "build", *std_go_args(...)`; depend on `go` as a build dep.
- **Rust-based** (`woti.rb`): Use `system "cargo", "install", *std_cargo_args`; depend on `rust` as a build dep.
- **Python-based** (`htmltab.rb`, `task-tui.rb`, `hledger-textual.rb`): Use `virtualenv_install_with_resources` with `resource` blocks for dependencies. Include all transitive deps — e.g. `beautifulsoup4 >= 4.13` pulls in `typing-extensions` which must be listed explicitly. When upstream only ships a prebuilt wheel (no sdist buildable without extra tooling like Rust/maturin), install the wheel resource directly with `venv.pip_install_and_link` instead of going through `virtualenv_install_with_resources` (see `hledger-textual.rb`).
- **Prebuilt binary releases** (`hister.rb`): Use `on_macos`/`on_linux` with `on_arm`/`on_intel` blocks pointing at platform-specific release URLs instead of building from source; useful when the real build requires toolchains this tap doesn't want to depend on (e.g. a full frontend build). Can include a `service do` block for `brew services`.
- **Simple installs** (`wd.rb`): Directly install scripts/man pages.

Formulas needing an authenticated source fetch (e.g. a private GitHub repo) pass `headers:` on the `url` with a token from `ENV` (see `ops.rb`), and generally carry a `revision` since there's no public release tag to bump.

## Updating a Formula

When updating a formula version:
1. Change the `url` to point to the new version
2. Update `sha256` — use `just sha256 <formula>.rb` to compute it from the new URL
3. Remove or reset `revision` if present (revision is only for non-version bumps)
