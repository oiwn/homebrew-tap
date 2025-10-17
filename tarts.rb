#!/usr/bin/env ruby
# Then users can: `brew tap oiwn/tarts` and `brew install tarts`.

class Tarts < Formula
  desc "Terminal Arts - Screen savers and visual effects for terminal"
  homepage "https://github.com/oiwn/tarts"
  license "MIT"

  # Replace VERSION and SHA256 for each tagged release
  url "https://github.com/oiwn/tarts/archive/refs/tags/vVERSION.tar.gz"
  sha256 "REPLACE_WITH_SHA256"
  version "VERSION"

  depends_on "rust" => :build

  def install
    # Build and install from source; uses the lockfile and pins deps
    system "cargo", "install", "--locked", "--root", prefix.to_s, "--path", "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tarts --version")
  end
end
