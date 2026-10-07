cask "genignore" do
  version "2.0.0"
  sha256 arm: "ec0a6ae2473e5045583895e8cc958a986e003e96b77cf6d6b18f6b801b096736",
         intel: "3745adf39a5671c041afe32428d23a78e42645f8b5b22a4ec486b0989ce43a42"

  url "https://github.com/aaronflorey/genignore/releases/download/v#{version}/genignore_#{version}_darwin_#{arch == :arm ? "arm64" : "amd64"}.tar.gz",
      verified: "github.com/aaronflorey/genignore/"
  name "genignore"
  desc "Generate and maintain safe .gitignore blocks"
  homepage "https://github.com/aaronflorey/genignore"

  binary "genignore"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/genignore"]
  end
end
