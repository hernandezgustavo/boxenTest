class apps::vim {
  # vim has a dependency on python
  # https://github.com/boxen/puppet-vim/issues/16
  include python

  # explicitly include top-level vim
  # https://projects.puppetlabs.com/issues/2053
  include ::vim

  # managing .vimrc
  file { "${::vim::vimrc}": ensure => exists }

  file_line { 'set_line_numbers_in_vim':
    line => 'set number',
    path => "${::vim::vimrc}"
  }

  vim::bundle { [
    'kien/ctrlp.vim',
    'mattn/emmet-vim',
    'scrooloose/syntastic',
    'scrooloose/nerdtree',
    'tpope/vim-sensible',
  ]: }
}
