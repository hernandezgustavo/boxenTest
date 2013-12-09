class people::johnemau {

  include iterm2::dev
  include sublime_text_3::package_control
  include apps::vim::typescript
  include apps::fishShell

  include projects::devdashboard
  include projects::chefclient
  include projects::ppm
  include projects::ppmspa

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
