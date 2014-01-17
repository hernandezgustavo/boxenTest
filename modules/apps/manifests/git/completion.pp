class apps::git::completion {
  $home = "/Users/${::boxen_user}"

  file { "${home}/.git-completion.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/shared/git-completion.sh"
  }
}
