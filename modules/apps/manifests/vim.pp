class apps::vim {
  # vim has a dependency on python
  # https://github.com/boxen/puppet-vim/issues/16
  include python

  # explicitly include top-level vim
  # https://projects.puppetlabs.com/issues/2053
  include ::vim

  # managing .vimrc
  file { "${::vim::vimrc}":
    ensure => present
  }

  # source defaults set in apps/files/vim/.vimrc
  file_line { 'source_apps_vimrc':
    line => ":so ${$boxen::config::repodir}/modules/apps/files/vim/.vimrc",
    path => "${::vim::vimrc}",
    require => [
      File["${::vim::vimrc}"]
    ]
  }

  vim::bundle { [
    'kien/ctrlp.vim',
    'mattn/emmet-vim',
    'scrooloose/syntastic',
    'scrooloose/nerdtree',
    'tpope/vim-sensible',
  ]: }
}
