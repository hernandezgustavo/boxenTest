class people::park9140 {
  include apps::fishShell

  include chrome::canary

  include firefox

  include iterm2::dev


  $home = "/Users/${::boxen_user}"

  exec {  "set_vmware_fusion_key_park9140":
    command=> "'/Applications/VMware Fusion.app/Contents/Library/vmware-licenseTool' enter N528L-0H30J-08362-038KP-A95KN '' '' '6.0' 'VMware Fusion for Mac OS' ''",
    user => root
  }

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => "${$boxen::config::repodir}/modules/people/files/park9140/VagrantVMWareFusionLicense_sweitzel_jpark.lic"
  }

  file { "${home}/.config/fish/personal.fish":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/park9140/personal.fish",
    subscribe => File["${home}/.config/fish/"]
  }

  git::config::global { 'user.email':
    value  => 'jpark@daptiv.com'
  }
  git::config::global { 'user.name':
    value  => 'Jonathan Park'
  }

  file { "${home}/.bash_profile":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/park9140/.bash_profile"
  }

  include atom

  repository{
    'my atom config':
    source   => 'git@github.com:park9140/atom-config', #short hand for github repos
    provider => 'git',
    path => "${home}/.atom",
    force => true
  }


  repository{
    'my sublime config':
    source   => 'git@github.com:park9140/sublimeconfig', #short hand for github repos
    provider => 'git',
    path => "${home}/sublimeconfig",
    force => true
  }


  include apps::sublime::ensure_settings_links_exist


  #used to share editing at floobits.com
  include apps::sublime::wombat_theme
  include apps::sublime::bracket_highlighter
  include apps::sublime::jsdocs
  include apps::sublime::grunt
  include apps::sublime::git
  include apps::sublime::history
  include apps::sublime::markdown
  include apps::sublime::fileautocomplete
  include apps::sublime::sidebar
  include sublime_text_3::package_control

  sublime_text_3::package { 'OmniSharpSublimePlugin':
    source => 'git@github.com:PaulCampbell/OmniSharpSublimePlugin.git'
  }


  nodejs::module { 'typescript-tools':
    node_version => 'v0.10',
    ensure => '0.2.2-1'
  }
}
