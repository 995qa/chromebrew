require 'package'

class Mobile_broadband_provider_info < Package
  description 'Network Management daemon'
  homepage 'https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info'
  version '20201225'
  license 'CC-PD'
  compatibility 'all'
  source_url "https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/archive/#{version}/mobile-broadband-provider-info-#{version}.tar.bz2"
  source_sha256 '0616b3d0580575741d4319ac71ca67c9a378879943d32a67ac0460615767bcdf'
  binary_compression 'tar.xz'

  binary_sha256({
    aarch64: 'bcd1950197cad4165f2ae459e479a33ffdf923f8ba15825bf1a7b98759c2ae6e',
     armv7l: 'bcd1950197cad4165f2ae459e479a33ffdf923f8ba15825bf1a7b98759c2ae6e',
       i686: 'ef85604f9bd2d1094e3a36191c2f30d3e94d75b060e78a85c2a1d42819f8d453',
     x86_64: '38026295f81010e8e1a311d5f0c28322b4059213bf012a9897b9b8a8a2a43335'
  })

  depends_on 'libxslt'

  def self.build
    system 'NOCONFIGURE=1 ./autogen.sh'
    system "env CFLAGS='-flto=auto' \
      CXXFLAGS='-flto=auto' LDFLAGS='-flto=auto' \
      ./configure #{CREW_OPTIONS}"
    system 'make'
  end

  def self.install
    system "make DESTDIR=#{CREW_DEST_DIR} install"
  end
end
