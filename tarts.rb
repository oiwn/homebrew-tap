#!/usr/bin/env ruby
# Homebrew Formula (build-from-source) for Tarts
# Users install with: `brew tap oiwn/tap && brew install tarts`

class Tarts < Formula
  desc "Terminal Arts - Screen savers and visual effects for terminal"
  homepage "https://github.com/oiwn/tarts"
  license "MIT"

  url "https://github.com/oiwn/tarts/archive/refs/tags/v0.1.23.tar.gz"
  sha256 "707c10aa58a41cc8ec3e995db640411b73c0b21343d3ec3200faec0a49d19d38"
  version "0.1.23"

  depends_on "rust" => :build

  def install
    # Build and install from source. std_cargo_args sets prefix, lockfile reproducibility, etc.
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tarts --version")
  end
end
