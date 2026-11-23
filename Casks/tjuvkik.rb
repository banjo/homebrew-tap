cask "tjuvkik" do
  version "0.1.7"
  sha256 "1f5cfe954c635cdc234aadca3da20584f48e6a5570ec5b11d3e8e2da97833139"

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
