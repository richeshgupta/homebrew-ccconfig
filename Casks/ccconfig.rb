cask "ccconfig" do
  version "0.1.1"

  on_intel do
    url "https://github.com/richeshgupta/ccconfig-releases/releases/download/v#{version}/ccconfig_#{version}_x64.dmg"
    sha256 "3202f4c8d45b6ce90bed6e4cce3466f1f4f4af6e1d6e6b4332b05387b38312b9"
  end

  on_arm do
    url "https://github.com/richeshgupta/ccconfig-releases/releases/download/v#{version}/ccconfig_#{version}_aarch64.dmg"
    sha256 "03df080f7cff45ac4958a834835febd0d37cb00eabe29e7bd93d76705792d177"
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
