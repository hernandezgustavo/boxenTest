class people::johnemau {
  include daptiv::fishShell
  include daptiv::sublime
  include daptiv::rdp
  include chrome
  include chrome::canary
  include iterm2::dev
  include projects::ppm
  include projects::ppmspa
  include projects::devdashboard

  # vim has a dependency on python, https://github.com/boxen/puppet-vim/issues/16
  include python
  include vim

  # link in your personal dot files the provided files live in the people/files dir and
  # you should copy them to a folder matching your personal user if you intend to personalize them 
  # if you do not copy these your dotfiles will change when this default profile is updated as they
  # are symlinked into your home directory.
  $home = "/Users/${::boxen_user}"
  $dotfiles_dir = "${$boxen::config::repodir}/dotfiles"

  # managing .vimrc
  file { "${vim::vimrc}": ensure => exists }

  # fixes warning if using vim syntastic plugin with fish shell
  file_line { 'set_vim_shell_to_bash':
    line => 'set shell=/bin/bash',
    path => "${vim::vimrc}"
  }

  vim::bundle { [
    'scrooloose/syntastic',
    'scrooloose/nerdtree',
    'mattn/emmet-vim',
    'tpope/vim-sensible',
    'kien/ctrlp.vim'
  ]: }

  git::config::global { 'user.email':
    value  => 'jemau@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'John Emau'
  }

  sublime_text_3::package { 'Floobits':
    source => 'git@github.com:Floobits/floobits-sublime'
  }
  sublime_text_3::package { 'BracketHighlighter':
    source => 'git@github.com:facelessuser/BracketHighlighter'
  }
  sublime_text_3::package { 'sublime-jsdocs':
    source => 'git@github.com:spadgos/sublime-jsdocs'
  }
  sublime_text_3::package { 'T3S':
    source => 'git@github.com:Railk/T3S'
  }
}
