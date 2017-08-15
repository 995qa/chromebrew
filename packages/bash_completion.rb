require 'package'

class Bash_completion < Package
  description 'Programmable completion functions for bash'
  homepage 'https://github.com/scop/bash-completion'
  version '2.7'
  source_url 'https://github.com/scop/bash-completion/archive/2.7.tar.gz'
  source_sha256 'dba2b88c363178622b61258f35d82df64dc8d279359f599e3b93eac0375a416c'

  depends_on 'autoconf'
  depends_on 'automake'

  def self.build
    system "autoreconf -i"
    system "./configure"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
    puts "Add the floowing to your .bashrc"
    puts "[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion ]] && \\"
    puts ". /usr/local/share/bash-completion/bash_completion"
  end

end
