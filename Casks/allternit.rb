cask "allternit" do
  version "1.0.0"
  sha256 "18aca858465c69429a11baa176ac7424f1633151464bf66bfaaf056b24590c15"

  url "https://github.com/Gizziio/desktop/releases/download/v#{version}/Allternit-Desktop-#{version}-arm64.dmg"
  name "Allternit Desktop"
  desc "AI-powered autonomous coding platform with local execution"
  homepage "https://allternit.com"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true

  app "Allternit Desktop.app"

  zap trash: [
    "~/Library/Application Support/Allternit Desktop",
    "~/Library/Caches/com.allternit.desktop",
    "~/Library/Logs/Allternit Desktop",
    "~/Library/Preferences/com.allternit.desktop.plist",
    "~/Library/Saved Application State/com.allternit.desktop.savedState",
  ]

  caveats <<~EOS
    Allternit Desktop requires macOS 13+ (Ventura or later).

    On first launch, if Gatekeeper blocks the app, right-click Allternit Desktop
    in Applications and select "Open". This is normal until the app is fully
    notarized with Apple.

    The app includes an auto-updater that checks for new versions on launch.
  EOS
end
