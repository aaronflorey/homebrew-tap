cask "genignore" do
  version "2.1.0"
  sha256 arm: "496945b4da46fa21cafd360e6e21375e9a27c636a2da8ee839761363c5514d22",
         intel: "ffb33ddd7699935c863e37332b79de473d8d76d28121dfade5a70d565b49c35a"

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
