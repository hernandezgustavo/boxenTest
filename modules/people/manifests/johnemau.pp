class people::johnemau {

  include iterm2::dev
  include macvim
  include sublime_text_3::package_control

  include apps::vim::typescript
  include apps::fishShell
  include apps::git::aliases

  include projects::devdashboard
  include projects::chefclient
  include projects::ppm
  include projects::ppmspa

  include osx::mouse::enable_right_click
  include osx::finder::show_hidden_files

  $home = "/Users/${::boxen_user}"
  $files = "${$boxen::config::repodir}/modules/people/files/johnemau"

  file { "${home}/.bash_profile":
    ensure  => "${files}/.bash_profile"
  }

  file { "${home}/.config/fish/personal.fish":
    ensure  => "${files}/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }

  # fixes warning if using vim syntastic plugin with fish shell
  file_line { 'set_vim_shell_to_bash':
    line => 'set shell=/bin/bash',
    path => "${vim::vimrc}"
  }

  # run pathogen
  file_line { 'load_vim_plugins_via_pathogen':
    line => 'execute pathogen#infect()',
    path => "${vim::vimrc}"
  }

  file { "${home}/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings":
    ensure  => "${files}/Preferences.sublime-settings"
  }

  sublime_text_3::package { 'Floobits':
    source => 'git@github.com:Floobits/floobits-sublime'
  }
  sublime_text_3::package { 'Wombat Theme':
    source => 'git@github.com:sheerun/sublime-wombat-theme'
  }
  sublime_text_3::package { 'BracketHighlighter':
    source => 'git@github.com:facelessuser/BracketHighlighter'
  }

  git::config::global { 'user.email':
    value  => 'jemau@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'John Emau'
  }

}
