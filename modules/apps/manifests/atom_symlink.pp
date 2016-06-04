class apps::atom_symlink {

  file { '/usr/local/bin/atom':
    ensure => 'link',
    target => '/Applications/Atom.app/Contents/Resources/app/atom.sh'
  }

}
