class people::johnemau {
  include apps::vim::typescript
  include apps::fishShell
  include iterm2::dev
  include projects::devdashboard
  include projects::ppm
  include projects::ppmspa

  # vim has a dependency on python, https://github.com/boxen/puppet-vim/issues/16
  include python
  include vim

  # fixes warning if using vim syntastic plugin with fish shell
  file_line { 'set_vim_shell_to_bash':
    line => 'set shell=/bin/bash',
    path => "${vim::vimrc}"
  }

  git::config::global { 'user.email':
    value  => 'jemau@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'John Emau'
  }

}
