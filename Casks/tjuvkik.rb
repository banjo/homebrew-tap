cask "tjuvkik" do
  version "0.1.3"
  sha256 "8dbc490a130e6fb35d03dfa40d91a562bc66350f8aa0b3e291ef8ad36903efa2"

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
