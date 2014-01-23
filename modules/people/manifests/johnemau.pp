class people::johnemau {

  include iterm2::dev
  include macvim
  include sublime_text_3::package_control

  include apps::vim::typescript
  include apps::fishShell

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

  include apps::sublime::floobits
  include apps::sublime::wombat_theme
  include apps::sublime::bracket_highlighter


  git::config::global { 'user.email':
    value  => 'jemau@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'John Emau'
  }

}
