class Geni < Formula
  desc "Database CLI migration tool"
  homepage "https://github.com/emilpriver/geni"
  url "https://github.com/emilpriver/geni/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "6617cf0f0a2f9b0f9f7dd93304a037bd957296e4863a38e14557b2c87aae2f01"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    ENV["DATABASE_URL"] = "sqlite3://test.sqlite"
    system bin/"geni", "create"
    assert_predicate testpath/"test.sqlite", :exist?, "failed to create test.sqlite"
  end
end

