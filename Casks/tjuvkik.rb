cask "tjuvkik" do
  version "0.1.1"
  sha256 "335a855234c3e06a9b9d4897da52a138435390cc55bbac5cb39aa248839c3b36"

  url "https://github.com/banjo/tjuvkik/releases/download/v#{version}/Tjuvkik-#{version}.zip"
  name "Tjuvkik"
  desc "Hold fn to glance at your coding agents"
  homepage "https://tjuvkik.banjoanton.com"

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Tjuvkik.app"
  binary "#{appdir}/Tjuvkik.app/Contents/MacOS/Tjuvkik", target: "tjuvkik"

  # Signed with a self-signed certificate, not notarized, so Gatekeeper would block it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Tjuvkik.app"],
        writable_paths: ["{{appdir}}/Tjuvkik.app"]
  end

  uninstall quit: "se.banjo.tjuvkik"
end
