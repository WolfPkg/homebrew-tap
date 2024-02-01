class Foma < Formula
  desc "Multi-purpose finite-state toolkit"
  homepage "https://github.com/mhulden/foma"
  url "https://apertium.projectjj.com/apt/nightly/source/foma/foma_0.10.0+s319.orig.tar.bz2"
  version "0.10.0"
  sha256 "e1e1fe43890619fa7209b06a750de91a54c4d4e913d1342860c057b1831b522b"
  license "Apache-2.0"

  head "https://github.com/mhulden/foma.git", branch: "master"

  bottle do
    root_url "https://github.com/WolfPkg/homebrew-tap/releases/download/foma-0.10.0"
    sha256 cellar: :any,                 ventura:      "5644ecacd5ea1462fb86fd7e9167dfce765a086115d96f2658698d38ff8853c0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5c3efd23bc8068a915a9b80e2ab1b1c7c17899d462bf1cfcf774d2d59f5894fd"
  end

  depends_on "bison" => :build
  depends_on "cmake" => :build
  depends_on "flex" => :build
  depends_on "pkg-config" => :build
  depends_on "readline"
  depends_on "zlib"

  def install
    if build.head?
      system "cmake", "-S", "foma", "-B", "build", *std_cmake_args
    else
      system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    end
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
