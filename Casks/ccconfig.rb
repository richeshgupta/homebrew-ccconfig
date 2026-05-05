cask "ccconfig" do
  version "0.1.2"

  on_intel do
    url "https://github.com/richeshgupta/ccconfig-releases/releases/download/v#{version}/ccconfig_#{version}_x64.dmg"
    sha256 "0fceeb8bfb4ca0fb1730cf863c29d12ee389524eda1ed6cffcd162d67f1bfd3f"
  end

  on_arm do
    url "https://github.com/richeshgupta/ccconfig-releases/releases/download/v#{version}/ccconfig_#{version}_aarch64.dmg"
    sha256 "667187c5ef1aad21d8111a4fd20df43c059aa78886496b0814a1444519634da6"
  end

  name "CCConfig"
  desc "Claude Code configuration advisor and manager"
  homepage "https://github.com/richeshgupta/ccconfig"

  app "ccconfig.app"

  caveats <<~EOS
    CCConfig is not yet code-signed with an Apple Developer ID.
    macOS may report the app as "damaged" on first launch.

    To fix this, run:
      xattr -cr /Applications/ccconfig.app

    Then open the app normally or run:
      open -a ccconfig
  EOS

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
