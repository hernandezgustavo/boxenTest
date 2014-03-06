class apps::git::prompt {
  $home = "/Users/${::boxen_user}"

  file { "${home}/.git-prompt.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/shared/git-prompt.sh"
  }
}
