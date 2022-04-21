require 'package'

class Signal_desktop < Package
  description 'Private Messenger for Windows, Mac, and Linux'
  homepage 'https://signal.org/'
  version '5.40.0'
  license 'AGPL-3.0'
  compatibility 'x86_64'
  source_url "http://updates.signal.org/desktop/apt/pool/main/s/signal-desktop/signal-desktop_#{version}_amd64.deb"
  source_sha256 'c5fa3b2f41f6b4f20ea4f87f8eda1dddb6e673dc038d042af9a636456b571b0f'

  no_compile_needed

  depends_on 'at_spi2_atk'
  depends_on 'gtk3'
  depends_on 'sommelier'

  def self.patch
    system "sed -i 's,/opt,#{CREW_PREFIX}/share,' usr/share/applications/signal-desktop.desktop"
  end

  def self.install
    FileUtils.mkdir_p "#{CREW_DEST_PREFIX}/bin"
    FileUtils.mv 'usr/share', "#{CREW_DEST_PREFIX}"
    FileUtils.mv 'opt/Signal', "#{CREW_DEST_PREFIX}/share"
    FileUtils.ln_s "#{CREW_PREFIX}/share/Signal/signal-desktop", "#{CREW_DEST_PREFIX}/bin/signal-desktop"
  end

  def self.postinstall
    puts "\nType 'signal-desktop' to get started.\n".lightblue
  end
end
