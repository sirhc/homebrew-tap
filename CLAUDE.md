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

- **npm-based** (`atlassian-forge.rb`, `github-copilot.rb`): Use `system "npm", "install", *std_npm_args` with `bin.install_symlink`; depend on `node`.
- **Go-based** (`ops.rb`, `pup.rb`): Use `system "go", "build", *std_go_args(...)` or `gox`; depend on `go` as a build dep.
- **Python-based** (`htmltab.rb`, `task-tui.rb`): Use `virtualenv_install_with_resources` with `resource` blocks for dependencies.
- **Simple installs** (`wd.rb`): Directly install scripts/man pages.

## External Commands

The `cmd/` directory contains Homebrew external commands (e.g., `cmd/brew-recent.rb`), which add subcommands to `brew`. These use Homebrew's `AbstractCommand` API.

## Updating a Formula

When updating a formula version:
1. Change the `url` to point to the new version
2. Update `sha256` — use `just sha256 <formula>.rb` to compute it from the new URL
3. Remove or reset `revision` if present (revision is only for non-version bumps)
