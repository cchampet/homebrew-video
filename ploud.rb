require "formula"

class Ploud < Formula
  homepage "https://github.com/mikrosimage/loudness_validator"
  url "https://github.com/mikrosimage/loudness_validator.git", :tag => "v1.1"
  version "1.1"

  devel do
    url "https://github.com/mikrosimage/loudness_validator.git", :branch => "develop"
    version "develop"
  end

  depends_on :x11
  depends_on "scons" => :build
  depends_on "boost"
  depends_on "libsndfile"
  depends_on "qt4" => :recommended  # for loudness-validator app (need XQuartz, https://xquartz.macosforge.org)
  depends_on "cbenhagen/homebrew-video/avtranscoder" => :recommended  # for media-loudness-analyser app

  def install
      system "scons", "--mode=release", "--install-sandbox=#{prefix}", "install"
  end
end
