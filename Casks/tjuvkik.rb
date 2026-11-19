cask "tjuvkik" do
  version "0.1.2"
  sha256 "24228bb9c66d01268a58bc5249fb070d7e33ebfd77a73c2431d0c58d27c9369e"

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
