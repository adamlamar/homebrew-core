require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.1.80.tgz"
  sha256 "68aa0da0edeb5ff9dfac614f027857df998d694a75853528044886a5008d1ef5"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "cdec0b8d38b595c04137126a75cd8df9b4e97bab99e92e351f3af76d425fd1ee"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
