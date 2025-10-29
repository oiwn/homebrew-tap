#!/usr/bin/env ruby
# Homebrew Formula (build-from-source) for Tarts
# Users install with: `brew tap oiwn/tap && brew install tarts`

class Tarts < Formula
  desc "Terminal Arts - Screen savers and visual effects for terminal"
  homepage "https://github.com/oiwn/tarts"
  license "MIT"

  url "https://github.com/oiwn/tarts/archive/refs/tags/v0.1.24.tar.gz"
  sha256 "97b96d0c3994a9444f10f285d9290755ab27354ae4162d9a6a749b82cd20f70f"
  version "0.1.24"

  depends_on "rust" => :build

  def install
    # Build and install from source. std_cargo_args sets prefix, lockfile reproducibility, etc.
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tarts --version")
  end
end
