cask "ccconfig" do
  version "0.1.0"

  on_intel do
    url "https://github.com/richeshgupta/ccconfig/releases/download/v#{version}/ccconfig_#{version}_x64.dmg"
    sha256 "INTEL_SHA256_PLACEHOLDER"
  end

  on_arm do
    url "https://github.com/richeshgupta/ccconfig/releases/download/v#{version}/ccconfig_#{version}_aarch64.dmg"
    sha256 "ARM_SHA256_PLACEHOLDER"
  end

  name "CCConfig"
  desc "Claude Code configuration advisor and manager"
  homepage "https://github.com/richeshgupta/ccconfig"

  app "ccconfig.app"

  zap trash: [
    "~/Library/Application Support/ccconfig",
    "~/Library/Preferences/in.richesh.ccconfig.plist",
    "~/Library/Caches/in.richesh.ccconfig",
  ]

  livecheck do
    url :url
    strategy :github_latest
  end
end
