class GizziCode < Formula
  desc "AI-powered terminal interface for the Allternit ecosystem"
  homepage "https://docs.gizziio.com"
  version "2.1.2"
  license "Apache-2.0"

  # Release tags look like "gizzi-code/v2.0.5"; assets are version-named:
  # gizzi-code-v2.0.5-<target>.tar.gz
  base_url = "https://github.com/Gizziio/allternit-platform/releases/download/gizzi-code/v#{version}"

  # macOS ARM64 (Apple Silicon)
  if OS.mac? && Hardware::CPU.arm?
    url "#{base_url}/gizzi-code-v#{version}-darwin-arm64.tar.gz"
    sha256 "a26aee37b8eaaba186016f16d2039fdcc0d45334b8086b1a8707a4ea231ce3f6"
  end

  # macOS Intel
  if OS.mac? && Hardware::CPU.intel?
    url "#{base_url}/gizzi-code-v#{version}-darwin-x64.tar.gz"
    sha256 "71108be1539b0ab57810e1d56fade37c1256a0fa9f30d8c4c1c156b383ee29a7"
  end

  # Linux ARM64
  if OS.linux? && Hardware::CPU.arm?
    url "#{base_url}/gizzi-code-v#{version}-linux-arm64.tar.gz"
    sha256 "2d85f154828cf96ddd0dcfbbdd528411e996b87abeb5c4244e8f3615bf317545"
  end

  # Linux x64
  if OS.linux? && Hardware::CPU.intel?
    url "#{base_url}/gizzi-code-v#{version}-linux-x64.tar.gz"
    sha256 "a6152050e80471aa4ee10fd0b89b082c1ea90d838d337213de91163b3beaa8b2"
  end

  def install
    bin.install "gizzi-code"
    bin.install_symlink "gizzi-code" => "gizzi"

    # Install shell completions
    bash_completion.install "completions/gizzi-code.bash" if File.exist?("completions/gizzi-code.bash")
    zsh_completion.install "completions/_gizzi-code" if File.exist?("completions/_gizzi-code")
    fish_completion.install "completions/gizzi-code.fish" if File.exist?("completions/gizzi-code.fish")
  end

  test do
    system "#{bin}/gizzi-code", "--version"
  end
end
